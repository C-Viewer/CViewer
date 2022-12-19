using CViewer.DataAccess.DataManager;
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.InnerEntities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;
using static CViewer.DataAccess.EntitiesHelper;

namespace CViewer.Services
{
    internal sealed class CVService : ICVService
    {
        public Cv CreateCVForReview(CVDraftParameter cvDraft, Profile applicant)
        {
            Cv newCv = new Cv();
            newCv.PeopleCreatedId = applicant.Id;
            newCv.DateCreation = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow);
            newCv.Specialization = applicant.Specialization;
            newCv.Status = DataManager.GetStatus(CVStatusType.SentToReview);
            foreach(int t in cvDraft.Tags)
            {
                newCv.Tags.Add(DataManager.GetTag(t));
            }
            newCv.Title = cvDraft.Title;
            newCv.OpenToReview = true;

            DataManager.AddCV(newCv);

            return newCv;
        }

        public async Task<string> StoreFileAsync(IFormFile file, IAmazonS3Service service)
        {
            WorkWithFiles workWithFiles = new WorkWithFiles();
            string date = workWithFiles.GetDateForName();

            string path = Path.GetFileNameWithoutExtension(file.FileName) + "_" + date.Replace(' ', '_') + Path.GetExtension(file.FileName);

            bool status = await service.AddFileAsync(file, path);
            if (status) return service.GetAmazonFileURL(path);
            else return null;
        }

        public void PinToHistory(string fileName, string urlForDownload, int cvId, int authorId)
        {
            DataManager.AddCVHistory(fileName, urlForDownload, cvId, authorId);
        }

        public Cv UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<Tag> tags = null, string description = null)
        {
            var cvForUpdating = CVRepository.CVs.FirstOrDefault(o => o.Id == cvId);

            if (cvForUpdating is null) return null;

            if (title != null)
            {
                cvForUpdating.Title = title;
            }

            if (specialization != null)
            {
                cvForUpdating.Specialization = (Specialization)specialization;
            }

            if (tags != null)
            {
                foreach(Tag tag in tags)
                {
                    cvForUpdating.Tags.Add(tag);
                }
            }

            if (description != null)
            {
                cvForUpdating.Description = description;
            }

            return cvForUpdating;
        }

        // ToDo: Add validation on empty data
        public CvHistory CreateCVEventForHistory(CVHistoryParameter cvHistoryParameter, out string errMsg)
        {
            errMsg = String.Empty;
            Profile profile = DataManager.GetProfile(cvHistoryParameter.AuthorId);
            if (profile == null)
            {
                errMsg = "Profile which is chosen as author does not found.";
                return null;
            }

            Cv cv = DataManager.GetCv(cvHistoryParameter.CvId);
            if (cv == null)
            {
                errMsg = "Cv which is chosen does not found.";
                return null;
            }

            CvHistory newCvHistory = new CvHistory
            {
                Id = DataManager.GetCVHistoriesCount() + 1,
                CvId = cvHistoryParameter.CvId,
                Comment = cvHistoryParameter.Comment,
                DateTime = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = cvHistoryParameter.AuthorId,
                Grade = cvHistoryParameter.Grade,
            };

            return newCvHistory;
        }

        public Status GetCVStatus(int cvId)
        {
            return DataManager.GetCv(cvId).Status;
        }

        public Cv GetCV(int cvId)
        {
            var cv = CVRepository.CVs.FirstOrDefault(o => o.Id == cvId);

            if (cv is null) return null;

            return cv;
        }

        public CvHistory GetCVHistory(int cvHistoryId)
        {
            var cvHistory = CVHistoryRepository.CVHistories.FirstOrDefault(o => o.Id == cvHistoryId);

            if (cvHistory is null) return null;

            return cvHistory;
        }

        public AttachedFile GetAttachedFile(int attachedFileId)
        {
            var attachedFile = AttachedFileRepository.AttachedFiles.FirstOrDefault(o => o.Id == attachedFileId);

            if (attachedFile is null) return null;

            return attachedFile;
        }

        public List<Tag> ListCVTags()
        {
            return CVTagRepository.CVTags;
        }

        public List<CVStatusTypeObject> ListCVStatuses()
        {
            return DataManager.GetCVStatuses().Select(status => new CVStatusTypeObject(status)).ToList();
        }

        public List<Specialization> ListSpecializations()
        {
            return SpecializationRepository.Specializations;
        }

        public List<Cv> ListCvsOpenedForReview()
        {
            return DataManager.ListCvsOpenedForReview();
        }

        public bool TakeCvToReview(int cvId, int expertId, out string errorMessage)
        {
            errorMessage = string.Empty;
            Cv takenCv = DataManager.GetCv(cvId);
            if (!takenCv.OpenToReview)
            {
                errorMessage = "Chosen Cv was already taken to review.";
                return false;
            }

            takenCv.OpenToReview = false;
            takenCv.Profiles.Add(DataManager.GetProfile(expertId));
            takenCv.Status = DataManager.GetStatus(CVStatusType.TakenToReview);

            return true;
        }

        public void MakeCvAsGood(int cvId)
        {
            DataManager.MakeCvAsGood(cvId);
        }

        public List<Cv> ListGoodCvs()
        {
            return DataManager.ListGoodCvs();
        }

        public void UpdateCvStatusIfNecessary(CvHistory cvEventForHistory)
        {
            Cv cv = DataManager.GetCv(cvEventForHistory.CvId);
            if (cvEventForHistory.Grade == null) { return; }
            else { cv.Grade = cvEventForHistory.Grade; }

            if (cvEventForHistory.Grade >= 4)
            {
                cv.Status = DataManager.GetStatus(CVStatusType.Reviewed);
                return;
            }

            cv.Status = DataManager.GetStatus(CVStatusType.NeedFix);
        }

        public void PinFileToCv(int cvId, string fileName, string urlToStoreFile)
        {
            Cv cv = DataManager.GetCv(cvId);
            cv.PinnedFileName = fileName;
            cv.UrlFileForDownload = urlToStoreFile;
        }

        public void FinishCvReview(Cv cv)
        {
            cv.Status = DataManager.GetStatus(CVStatusType.Finished);
        }

        public List<CvHistory> ListCVHistories()
        {
            List<CvHistory> cvHistories = CVHistoryRepository.CVHistories;
            return cvHistories;
        }

        public List<CvHistory> ListCVHistories(int cvId)
        {
            List<CvHistory> concreteCvHistories = DataManager.GetCVHistories(cvId);
            return concreteCvHistories;
        }

        public List<AttachedFile> ListAttachedFiles()
        {
            var attachedFiles = AttachedFileRepository.AttachedFiles;
            return attachedFiles;
        }

        public List<Cv> ListCVs()
        {
            var cvs = CVRepository.CVs;
            return cvs;
        }

        public List<Cv> ListCVsForProfile(string applicantOrExpertToken)
        {
            ProfileToToken profileToToken = DataManager.GetProfileAndToken(applicantOrExpertToken);
            if (profileToToken == null)
            {
                return null;
            }

            return DataManager.GetCvsForProfile(profileToToken.ProfileId);
        }

        public async Task<string> GenerateCViewerReportAsync(DateTime date, IAmazonS3Service amazonS3Service)
        {
            return await DataManager.GenerateCViewerReportAsync(date, amazonS3Service);
        }

        //public bool Delete(int id)
        //{
        //    var oldMovie = CVRepository.CVs.FirstOrDefault(o => o.Id == id);
        //
        //    if (oldMovie is null) return false;
        //
        //    CVRepository.CVs.Remove(oldMovie);
        //
        //    return true;
        //}
    }
}
