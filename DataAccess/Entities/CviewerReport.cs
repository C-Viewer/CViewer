namespace CViewer.DataAccess.Entities
{
    public class CviewerReport
    {
        public string option0 { get; }
        public int property0 { get;}
        public string option1 { get; }
        public int property1 { get; }
        public string option2 { get; }
        public int property2 { get; }
        public string option3 { get; }
        public int property3 { get; }
        public string option4 { get; }
        public int property4 { get; }

        public CviewerReport(DateTime date, int property0, int property1, int property2, int property3, int property4)
        {
            this.option0 = "Количество загруженных резюме за " + $"{date:Y}";
            this.option1 = "Количество загруженных файлов резюме за " + $"{date:Y}";
            this.option2 = "Количесво оценок экспертами за " + $"{date:Y}";
            this.option3 = "Количесво оценок пользователями за " + $"{date:Y}";
            this.option4 = "Количесво оценок на максимальный балл за " + $"{date:Y}";
            this.property0 = property0;
            this.property1 = property1;
            this.property2 = property2;
            this.property3 = property3;
            this.property4 = property4;
        }
    }
}
