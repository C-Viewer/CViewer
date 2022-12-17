using CViewer.DataAccess.DataManager;
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.InnerEntities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;
using static CViewer.DataAccess.EntitiesHelper;
using static System.Net.Mime.MediaTypeNames;

namespace CViewer.Services
{
    internal sealed class CVService : ICVService
    {
        public CV CreateCVForReview(CVDraftParameter cvDraft, Profile applicant)
        {
            CV newCv = new CV(DataManager.GetCVCount() + 1)
            {
                PeopleCreatedId = applicant.Id,
                DateCreation = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                Specialization = applicant.Specialization,
                StatusId = CVStatusType.SentToReview,
                Tags = cvDraft.Tags != null ? DataManager.GetTags(cvDraft.Tags) : null,
                Title = cvDraft.Title,
                OpenToReview = true,
            };

            DataManager.AddCV(newCv);

            return newCv;
        }

        public async Task<string> StoreFileAsync(IFormFile file, IAmazonS3Service service)
        {
            string date = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow).ToString();
            var charsToRemove = new string[] { ".", ":" };
            foreach (var c in charsToRemove)
            {
                date = date.Replace(c, string.Empty);
            }

            string path = Path.GetFileNameWithoutExtension(file.FileName) + "_" + date.Replace(' ', '_') + Path.GetExtension(file.FileName);

            bool status = await service.AddFileAsync(file, path);
            if (status) return service.GetAmazonFileURL(path);
            else return null;
        }

        public void PinToHistory(string fileName, string urlForDownload, int cvId, int authorId)
        {
            DataManager.AddCVHistory(fileName, urlForDownload, cvId, authorId);
        }

        public CV UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<CVTag> tags = null, string description = null)
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
                cvForUpdating.Tags = tags;
            }

            if (description != null)
            {
                cvForUpdating.Description = description;
            }

            return cvForUpdating;
        }

        // ToDo: Add validation on empty data
        public CVHistory CreateCVEventForHistory(CVHistoryParameter cvHistoryParameter, out string errMsg)
        {
            errMsg = String.Empty;
            Profile profile = DataManager.GetProfile(cvHistoryParameter.AuthorId);
            if (profile == null)
            {
                errMsg = "Profile which is chosen as author does not found.";
                return null;
            }

            CV cv = DataManager.GetCv(cvHistoryParameter.CVId);
            if (cv == null)
            {
                errMsg = "CV which is chosen does not found.";
                return null;
            }

            CVHistory newCvHistory = new CVHistory
            {
                Id = DataManager.GetCVHistoriesCount() + 1,
                CVId = cvHistoryParameter.CVId,
                Comment = cvHistoryParameter.Comment,
                DateTime = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = cvHistoryParameter.AuthorId,
                Grade = cvHistoryParameter.Grade,
            };

            return newCvHistory;
        }

        public CVStatusType GetCVStatus(int cvId)
        {
            return DataManager.GetCv(cvId).StatusId;
        }

        public CV GetCV(int cvId)
        {
            var cv = CVRepository.CVs.FirstOrDefault(o => o.Id == cvId);

            if (cv is null) return null;

            return cv;
        }

        public CVHistory GetCVHistory(int cvHistoryId)
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

        public List<CVTag> ListCVTags()
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

        public List<CV> ListCvsOpenedForReview()
        {
            return DataManager.ListCvsOpenedForReview();
        }

        public bool TakeCvToReview(int cvId, int expertId, out string errorMessage)
        {
            errorMessage = string.Empty;
            CV takenCv = DataManager.GetCv(cvId);
            if (!takenCv.OpenToReview)
            {
                errorMessage = "Chosen CV was already taken to review.";
                return false;
            }

            takenCv.OpenToReview = false;
            takenCv.ExpertIds = new List<int> { expertId };
            takenCv.StatusId = CVStatusType.TakenToReview;

            return true;
        }

        public void MakeCvAsGood(int cvId)
        {
            DataManager.MakeCvAsGood(cvId);
        }

        public List<CV> ListGoodCvs()
        {
            return DataManager.ListGoodCvs();
        }

        public void UpdateCvStatusIfNecessary(CVHistory cvEventForHistory)
        {
            CV cv = DataManager.GetCv(cvEventForHistory.CVId);
            if (cvEventForHistory.Grade == null)
            {
                return;
            }

            if (cvEventForHistory.Grade >= 4)
            {
                cv.StatusId = CVStatusType.Reviewed;
                return;
            }

            cv.StatusId = CVStatusType.NeedFix;
        }

        public void PinFileToCv(int cvId, string fileName, string urlToStoreFile)
        {
            CV cv = DataManager.GetCv(cvId);
            cv.PinnedFileName = fileName;
            cv.UrlFileForDownload = urlToStoreFile;
        }

        public void FinishCvReview(CV cv)
        {
            cv.StatusId = CVStatusType.Finished;
        }

        public List<CVHistory> ListCVHistories()
        {
            List<CVHistory> cvHistories = CVHistoryRepository.CVHistories;
            return cvHistories;
        }

        public List<CVHistory> ListCVHistories(int cvId)
        {
            List<CVHistory> concreteCvHistories = DataManager.GetCVHistories(cvId);
            return concreteCvHistories;
        }

        public List<AttachedFile> ListAttachedFiles()
        {
            var attachedFiles = AttachedFileRepository.AttachedFiles;
            return attachedFiles;
        }

        public List<CV> ListCVs()
        {
            var cvs = CVRepository.CVs;
            return cvs;
        }

        public List<CV> ListCVsForProfile(string applicantOrExpertToken)
        {
            ProfileToToken profileToToken = DataManager.GetProfileAndToken(applicantOrExpertToken);
            if (profileToToken == null)
            {
                return null;
            }

            return DataManager.GetCvsForProfile(profileToToken.ProfileId);
        }

        public CviewerReport GenerateCViewerReport(DateTime date)
        {
            return DataManager.GenerateCViewerReport(date);
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
