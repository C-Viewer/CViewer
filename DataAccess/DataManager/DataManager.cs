using CViewer.DataAccess.Entities;
using CViewer.Utils;
using System.Xml.Serialization;
using System.Xml;
using CViewer.Services;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;
using CViewer.DataAccess.Data;

namespace CViewer.DataAccess.DataManager
{
    // ToDo: Remove this bullshit. Need to add interface for data access.
    internal static class DataManager
    {
        internal const int EntityNotFound = -1;

        internal async static void SetTokenToProfileBySignIn(int profileId, Token token)
        {
            using CviewerContext db = new();
            ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p => p.ProfileId == profileId);
            if (profileToToken == null)
            {
                AddProfileAndToken(profileId, token);
                return;
            }

            profileToToken.Token = token;
            await db.SaveChangesAsync();
        }

        internal async static void AddProfileAndToken(int profileId, Token token)
        {
            using CviewerContext db = new();
            ProfileToToken profileToToken = new() { ProfileId = profileId, Token = token };
            db.Tokens.Add(token);
            db.ProfileToTokens.Add(profileToToken);
            await db.SaveChangesAsync();
        }

        internal static ProfileToToken GetProfileAndToken(string applicantOrExpertTokenValue)
        {
            using CviewerContext db = new();
            return db.ProfileToTokens.FirstOrDefault(p => p.Token != null && p.Token.Value.Equals(applicantOrExpertTokenValue));
        }

        internal static Token GetToken(ProfileToToken profileToToken)
        {
            using CviewerContext db = new();
            return db.Tokens.FirstOrDefault(p => p.Id.Equals(profileToToken.TokenId));
        }

        internal static Profile GetProfile(string applicantOrExpertTokenValue)
        {
            using CviewerContext db = new();
            ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p =>
                    p.Token != null && p.Token.Value == applicantOrExpertTokenValue);
            if (profileToToken == null)
            {
                return null;
            }

            return GetProfile(profileToToken.ProfileId);
        }

        internal static Profile GetProfile(int profileId)
        {
            using CviewerContext db = new();
            return db.Profiles.Where(u => u.Id == profileId).FirstOrDefault();
        }

        internal static Profile GetProfileFromMemory(string email, string password)
        {
            using CviewerContext db = new();
            return db.Profiles.FirstOrDefault(u => u.EmailAddress.Equals(email) && u.Password.Equals(password));
        }

        internal static int GetProfilesCountFromMemory()
        {
            using CviewerContext db = new();
            return db.Profiles.Count();
        }

        internal async static void AddProfileToMemory(Profile profile)
        {
            using CviewerContext db = new();
            db.Profiles.Add(profile);
            await db.SaveChangesAsync();
        }

        internal static List<int> GetProfilesIdsForCv(int cvId)
        {
            using (CviewerContext db = new())
            {
                Cv cv = db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
                if (cv == null)
                {
                    return new List<int> { EntityNotFound };
                }

                List<int> peopleIds = new() { cv.PeopleCreatedId };
                List<int> expertsIds = cv.CvExperts.Select(cv => cv.Id).ToList();
                if (expertsIds != null && expertsIds.Any())
                {
                    peopleIds.AddRange(expertsIds);
                }

                return peopleIds;
            }
        }

        internal static List<CvHistory> GetCVHistories(int cvId)
        {
            using CviewerContext db = new();
            return db.CvHistories.Where(h => h.CvId == cvId).OrderByDescending(el => el.DateTime).ToList();
        }

        internal static List<Cv> GetCvsForProfile(int profileId)
        {
            using CviewerContext db = new();
            return db.Cvs.Where(cv => cv.PeopleCreatedId == profileId || (!cv.OpenToReview && cv.CvExperts.Select(cv => cv.Id) != null && cv.CvExperts.Select(cv => cv.Id).Contains(profileId))).ToList();
        }

        internal static Cv GetCv(int cvId)
        {
            using CviewerContext db = new();
            return db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
        }

        public static List<Cv> ListCVs()
        {
            using CviewerContext db = new();
            return db.Cvs.ToList();
        }

        internal static int GetTokenCount()
        {
            using CviewerContext db = new();
            return db.Tokens.Count();
        }

        internal static Status GetStatus(CVStatusType s)
        {
            using CviewerContext db = new();
            return db.Statuses.Where(st => st.Name == s).FirstOrDefault();
        }

        internal static List<CVStatusType> GetCVStatuses()
        {
            return Enum.GetValues(typeof(CVStatusType)).Cast<CVStatusType>().ToList();
        }

        public static Profile GetExpertProfile(int expertId)
        {
            using CviewerContext db = new();
            return db.Profiles.FirstOrDefault(p => p.Id == expertId && p.IsExpert);
        }

        public static Profile GetApplicantProfile(int applicantId)
        {
            using CviewerContext db = new();
            return db.Profiles.FirstOrDefault(p => p.Id == applicantId && !p.IsExpert);
        }

        public async static void RemoveProfileAndToken(string applicantOrExpertTokenValue)
        {
            using CviewerContext db = new();
            ProfileToToken profileToToken = db.ProfileToTokens.FirstOrDefault(p => p.Token.Value == applicantOrExpertTokenValue);
            if (profileToToken != null)
            {
                db.ProfileToTokens.Remove(profileToToken);
                await db.SaveChangesAsync();
            }
        }

        public static List<Specialization> ListSpecializations()
        {
            using CviewerContext db = new();
            return db.Specializations.ToList();
        }

        public static int GetCVHistoriesCount()
        {
            using CviewerContext db = new();
            return db.CvHistories.Count();
        }

        public static int GetCVCount()
        {
            using CviewerContext db = new();
            return db.Cvs.Count();
        }

        public static Tag GetTag(int cvTag)
        {
            using CviewerContext db = new();
            return db.Tags.Where(t => t.Id == cvTag).FirstOrDefault();
        }

        public static List<Tag> ListCVTags()
        {
            using CviewerContext db = new();
            return db.Tags.ToList();
        }

        public async static void AddCV(Cv newCV)
        {
            using CviewerContext db = new();
            db.Cvs.Add(newCV);
            await db.SaveChangesAsync();
        }

        public async static void AddCVHistory(string fileName, string urlForDownload, int cvId, int authorId)
        {
            using CviewerContext db = new();
            CvHistory cvHistory = new()
            {
                //Id = GetCVHistoriesCount() + 1,
                FileName = fileName,
                AmazonPathToFile = urlForDownload,
                CvId = cvId,
                DateTime = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = authorId,
            };

            db.CvHistories.Add(cvHistory);
            await db.SaveChangesAsync();
        }

        public async static void AddCVHistory(CvHistory cvEventForHistory)
        {
            using CviewerContext db = new();
            db.CvHistories.Add(cvEventForHistory);
            await db.SaveChangesAsync();
        }

        public static List<Cv> ListCvsOpenedForReview()
        {
            using CviewerContext db = new();
            return db.Cvs.Where(cv => cv.OpenToReview).ToList();
        }

        public async static void MakeCvAsGood(int cvId)
        {
            using (CviewerContext db = new())
            {
                Cv cv = db.Cvs.FirstOrDefault(cv => cv.Id == cvId);
                cv.GoodCv = true;
                await db.SaveChangesAsync();
            }
        }

        public static List<Cv> ListGoodCvs()
        {
            using CviewerContext db = new();
            return db.Cvs.Where(cv => cv.GoodCv).OrderByDescending(cv => cv.Grade).ToList();
        }

        public static int GetReportsCount()
        {
            using CviewerContext db = new();
            return db.Reports.Count();
        }

        public async static void AddReport(string comment, int peopleId, int authorId, int mark)
        {
            using CviewerContext db = new();
            Report report = new()
            {
                //Id = GetReportsCount() + 1,
                Text = comment,
                ProfileId = peopleId,
                CreatedDate = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow),
                AuthorId = authorId,
                Rating = mark
            };

            db.Reports.Add(report);
            Profile profile = db.Profiles.Where(p => p.Id == peopleId).First();

            double marks = db.Reports.Where(r => r.ProfileId == peopleId).Select(r => r.Rating).Sum();
            double count = db.Reports.Where(r => r.ProfileId == peopleId).Count();
            profile.Rating = marks / count;
            await db.SaveChangesAsync();
        }

        public static async Task<string> GenerateCViewerReportAsync(DateTime date, IAmazonS3Service amazonS3Service)
        {
            using CviewerContext db = new();
            int allCv = db.Cvs.Where(cv => cv.DateCreation.Month == date.Month && cv.DateCreation.Year == date.Year).Count();
            int allCvFile = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.AmazonPathToFile != null).Count();
            int allExpertReports = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade != null).Count();
            int allApplicantReports = db.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year).Count();
            int allMaxReports = db.CvHistories.Where(cv => cv.DateTime.Month == date.Month && cv.DateTime.Year == date.Year && cv.Grade == 5).Count() + db.Reports.Where(r => r.CreatedDate.Month == date.Month && r.CreatedDate.Year == date.Year && r.Rating == 5).Count();
            CviewerReport cviewerReport = new()
            {
                option0 = "Количество загруженных резюме за " + $"{date:Y}",
                option1 = "Количество загруженных файлов резюме за " + $"{date:Y}",
                option2 = "Количество оценок экспертами за " + $"{date:Y}",
                option3 = "Количество оценок пользователями за " + $"{date:Y}",
                option4 = "Количество оценок на максимальный балл за " + $"{date:Y}",
                property0 = allCv,
                property1 = allCvFile,
                property2 = allExpertReports,
                property3 = allApplicantReports,
                property4 = allMaxReports
            };

            XmlSerializer xsSubmit = new(typeof(CviewerReport));
            var xml = "";

            using (var sww = new StringWriter())
            {
                using XmlWriter writer = XmlWriter.Create(sww);
                xsSubmit.Serialize(writer, cviewerReport);
                xml = sww.ToString();
            }

            string path = "";
            using (var stream = WorkWithFiles.GenerateStreamFromString(xml))
            {
                string dateNow = WorkWithFiles.GetDateForName();
                path = "report_" + dateNow.Replace(' ', '_') + ".xml";
                await amazonS3Service.AddFileAsync(WorkWithFiles.ReturnFormFile(stream, path), path);
            }

            return amazonS3Service.GetAmazonFileURL(path);
        }
    }
}
