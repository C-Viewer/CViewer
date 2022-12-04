using CViewer.DataAccess.DataRetrieval;
using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;

namespace CViewer.Services
{
    internal sealed class CVService : ICVService
    {
        public CV CreateCVDraft(CV cv, int applicantId)
        {
            cv.Id = CVRepository.CVs.Count + 1;
            CVRepository.CVs.Add(cv);

            return cv;
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
        public CVHistory AddEventToHistory(int cvId, DateTime dateTime, ICVService service, string fileName = null,
            string applicantComment = null, string expertComment = null, double? grade = null)
        {
            CVHistory cvHistory = new CVHistory
            {
                Id = CVHistoryRepository.CVHistories.Count + 1,
                CVId = cvId,
                ApplicantComment = applicantComment,
                ExpertComment = expertComment,
                DateTime = dateTime,

                // ToDo: Change to Amazon Path
                AmazonPathToFile = fileName,
                Grade = grade
            };

            if (fileName != null)
            {
                // ToDo: Add adding file path to Amazaon S3.
                int newAttachedFileId = AttachedFileRepository.AttachedFiles.Count + 1;
                var attachedFile = new AttachedFile()
                {
                    Id = newAttachedFileId,
                    FileName = fileName,
                    FilePath = $"HardCodePath/{fileName}"
                };
                AttachedFileRepository.AttachedFiles.Add(attachedFile);

                cvHistory.AttachedFileId = newAttachedFileId;
                cvHistory.AmazonPathToFile = fileName;
            }

            return cvHistory;
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

        public List<Specialization> ListSpecializations()
        {
            return SpecializationRepository.Specializations;
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
