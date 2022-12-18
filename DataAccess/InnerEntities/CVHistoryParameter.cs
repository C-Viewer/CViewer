﻿using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.InnerEntities
{
    public class CVHistoryParameter
    {
        [Required]
        public int CVId { get; set; }

        [Required]
        public int AuthorId { get; set; }
        public string FileName { get; set; }
        public string Comment { get; set; }
        public int? Grade { get; set; }
    }
}