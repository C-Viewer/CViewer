using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using CViewer.Utils;
using System.Xml.Serialization;
using System.Xml;
using CViewer.Services;
using Microsoft.AspNetCore.Mvc;

namespace CViewer.DataAccess.DataManager
{
    // ToDo: Remove this bullshit. Need to add interface for data access.
    internal static class DataManager
    {
        internal const int EntityNotFound = -1;

        internal static void SetTokenToProfileBySignIn(int profileId, Token token)
        { 
            ProfileToToken profileToToken = GetProfileAndToken(profileId);
            if (profileToToken == null)
            {
                AddProfileAndToken(profileId, token);
                return;
            }

            profileToToken.Token = token;
        }

        internal static void AddProfileAndToken(int profileId, Token token)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                ProfileToToken profileToToken = new ProfileToToken { ProfileId = profileId, Token = token };
                ProfileToTokenRepository.ProfilesToTokens.Add(profileToToken);
                TokenRepository.Tokens.Add(token);
            }
        }

        internal static ProfileToToken GetProfileAndToken(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.ProfileId == profileId);
            }
        }

        internal static ProfileToToken GetProfileAndToken(string applicantOrExpertTokenValue)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.Token != null && p.Token.Value.Equals(applicantOrExpertTokenValue));
            }
        }

        internal static Profile GetProfile(string applicantOrExpertTokenValue)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                ProfileToToken profileToToken = ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p =>
                    p.Token != null && p.Token.Value == applicantOrExpertTokenValue);
                if (profileToToken == null)
                {
                    return null;
                }

                return GetProfile(profileToToken.ProfileId);
            }
        }

        internal static Profile GetProfile(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(u => u.Id == profileId);
            }
        }

        internal static Profile GetProfileFromMemory(string email, string password)
        {
            // ToDo: Use salt and hash for password.
            return ProfileRepository.Profiles.FirstOrDefault(u =>
                u.EmailAddress.Equals(email) && u.Password.Equals(password));
        }

        internal static int GetProfilesCountFromMemory()
        {
            return ProfileRepository.Profiles.Count;
        }

        internal static void AddProfileToMemory(Profile profile)
        {
            ProfileRepository.Profiles.Add(profile);
        }

        internal static List<int> GetProfilesIdsForCv(int cvId)
        {
            if (TemporaryConfiguration.UseDb)
            {
                // ToDo
            }
            else
            {
                CV cv = CVRepository.CVs.FirstOrDefault(cv => cv.Id == cvId);
                if (cv == null)
                {
                    return new List<int> { EntityNotFound };
                }

                List<int> peopleIds = new List<int> { cv.PeopleCreatedId };
                List<int> expertsIds = cv.ExpertIds;
                if (expertsIds != null && expertsIds.Any())
                {
                    peopleIds.AddRange(expertsIds);
                }

                return peopleIds;
            }
        }

        internal static List<CVHistory> GetCVHistories(int cvId)
        {
            return CVHistoryRepository.CVHistories.Where(h => h.CVId == cvId).OrderByDescending(el => el.DateTime).ToList();
        }

        internal static List<CV> GetCvsForProfile(int profileId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.Where(cv => cv.PeopleCreatedId == profileId || (!cv.OpenToReview && cv.ExpertIds != null && cv.ExpertIds.Contains(profileId))).ToList();
            }
        }

        internal static CV GetCv(int cvId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.FirstOrDefault(cv => cv.Id == cvId);
            }
        }

        internal static int GetTokenCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return TokenRepository.Tokens.Count;
            }
        }

        internal static List<CVStatusType> GetCVStatuses()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVStatusRepository.CvStatuses;
            }
        }

        public static Profile GetExpertProfile(int expertId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(p => p.Id == expertId && p.IsExpert);
            }
        }

        public static Profile GetApplicantProfile(int applicantId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ProfileRepository.Profiles.FirstOrDefault(p => p.Id == applicantId && !p.IsExpert);
            }
        }

        public static void RemoveProfileAndToken(string applicantOrExpertTokenValue)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                 ProfileToToken profileToToken = ProfileToTokenRepository.ProfilesToTokens.FirstOrDefault(p => p.Token.Value == applicantOrExpertTokenValue);
                 if (profileToToken != null)
                 {
                     ProfileToTokenRepository.ProfilesToTokens.Remove(profileToToken);
                 }
            }
        }

        public static int GetCVHistoriesCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVHistoryRepository.CVHistories.Count;
            }
        }

        public static int GetCVCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.Count;
            }
        }

        public static List<CVTag> GetTags(List<int> cvTags)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                // ToDo: Adding Dictionary<int, string> will be better.
                return cvTags
                    .Where(id => CVTagRepository.CVTagIds.Contains(id))
                    .Select(id => CVTagRepository.CVTags.FirstOrDefault(t => t.Id == id))
                    .ToList();
            }
        }

        public static void AddCV(CV newCV)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                CVRepository.CVs.Add(newCV);
            }
        }

        public static void AddCVHistory(string fileName, string urlForDownload, int cvId, int authorId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                CVHistory cvHistory = new CVHistory
                {
                    Id = GetCVHistoriesCount() + 1,
                    FileName = fileName,
                    AmazonPathToFile = urlForDownload,
                    CVId = cvId,
                    DateTime = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                    AuthorId = authorId,
                };

                CVHistoryRepository.CVHistories.Add(cvHistory);
            }
        }

        public static void AddCVHistory(CVHistory cvEventForHistory)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                CVHistoryRepository.CVHistories.Add(cvEventForHistory);
            }
        }

        public static List<CV> ListCvsOpenedForReview()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.Where(cv => cv.OpenToReview).ToList();
            }
        }

        public static void MakeCvAsGood(int cvId)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                CV cv = CVRepository.CVs.FirstOrDefault(cv => cv.Id == cvId);
                cv.GoodCv = true;
            }
        }

        public static List<CV> ListGoodCvs()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return CVRepository.CVs.Where(cv => cv.GoodCv).OrderByDescending(cv => cv.Grade).ToList();
            }
        }

        public static int GetReportsCount()
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                return ReportRepository.Reports.Count;
            }
        }

        public static void AddReport(string comment, int peopleId, int authorId, int mark)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                Report report = new Report
                {
                    Id = GetReportsCount() + 1,
                    Text = comment,
                    PeopleId = peopleId,
                    CreatedDate = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                    AuthorId = authorId,
                    Rating = mark
                };

                ReportRepository.Reports.Add(report);

                Profile profile = ProfileRepository.Profiles.Where(p => p.Id == peopleId).First();
                double marks = ReportRepository.Reports.Where(r => r.PeopleId == peopleId).Select(r => r.Rating).Sum();
                double count = ReportRepository.Reports.Where(r => r.PeopleId == peopleId).Count();
                profile.Rating = marks/count;
            }
        }

        public static async Task<string> GenerateCViewerReportAsync(DateTime date, IAmazonS3Service amazonS3Service)
        {
            if (TemporaryConfiguration.UseDb)
            {

            }
            else
            {
                int allCv = CVRepository.CVs.Where(cv => cv.DateCreation.Month == date.Month && cv.DateCreation.Year == date.Year).Count();
                int allCvFile = CVHistoryRepository.CVHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.AmazonPathToFile != null).Count();
                int allExpertReports = CVHistoryRepository.CVHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade != null).Count();
                int allApplicantReports = ReportRepository.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year).Count();
                int allMaxReports = CVHistoryRepository.CVHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade == 5).Count() + ReportRepository.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year && r.Rating == 5).Count();
                CviewerReport cviewerReport = new CviewerReport();
                cviewerReport.option0 = "Количество загруженных резюме за " + $"{date:Y}";
                cviewerReport.option1 = "Количество загруженных файлов резюме за " + $"{date:Y}";
                cviewerReport.option2 = "Количесво оценок экспертами за " + $"{date:Y}";
                cviewerReport.option3 = "Количесво оценок пользователями за " + $"{date:Y}";
                cviewerReport.option4 = "Количесво оценок на максимальный балл за " + $"{date:Y}";
                cviewerReport.property0 = allCv;
                cviewerReport.property1 = allCvFile;
                cviewerReport.property2 = allExpertReports;
                cviewerReport.property3 = allApplicantReports;
                cviewerReport.property4 = allMaxReports;

                XmlSerializer xsSubmit = new XmlSerializer(typeof(CviewerReport));
                var xml = "";

                using (var sww = new StringWriter())
                {
                    using (XmlWriter writer = XmlWriter.Create(sww))
                    {
                        xsSubmit.Serialize(writer, cviewerReport);
                        xml = sww.ToString();
                    }
                }

                WorkWithFiles workWithFiles = new WorkWithFiles();

                string path = "";
                using (var stream = workWithFiles.GenerateStreamFromString(xml))
                {
                    string dateNow = workWithFiles.GetDateForName();
                    path = "report_" + dateNow.Replace(' ', '_') + ".xml";
                    await amazonS3Service.AddFileAsync(workWithFiles.ReturnFormFile(stream, path), path);
                }

                return amazonS3Service.GetAmazonFileURL(path);
            }
        }
    }
}