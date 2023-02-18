namespace CViewer.Utils
{
    public static class LocalTimeHelper
    {
        public static DateTime GetMoscowDateTime(DateTime utcTime)
        {
            return new DateTimeWithZone(utcTime,
                TimeZoneInfo.FindSystemTimeZoneById("Russian Standard Time")).LocalTime;
        }
    }

    public readonly struct DateTimeWithZone
    {
        private readonly DateTime _utcDateTime;
        private readonly TimeZoneInfo _timeZone;

        public DateTimeWithZone(DateTime utcDateTime, TimeZoneInfo timeZone)
        {
            _utcDateTime = utcDateTime;
            _timeZone = timeZone;
        }

        public DateTime UniversalTime => _utcDateTime;

        public TimeZoneInfo TimeZone => _timeZone;

        public DateTime LocalTime => TimeZoneInfo.ConvertTime(_utcDateTime, _timeZone);
    }
}
