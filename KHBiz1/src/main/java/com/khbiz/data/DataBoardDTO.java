package com.khbiz.data;

import java.sql.Date;

public class DataBoardDTO {
	
		private int num;
		private String title;
		private String writer;
		private String contents;
		private Date reg_date;
		/**
		 * @return the num
		 */
		public int getNum() {
			return num;
		}
		/**
		 * @param num the num to set
		 */
		public void setNum(int num) {
			this.num = num;
		}
		/**
		 * @return the title
		 */
		public String getTitle() {
			return title;
		}
		/**
		 * @param title the title to set
		 */
		public void setTitle(String title) {
			this.title = title;
		}
		/**
		 * @return the writer
		 */
		public String getWriter() {
			return writer;
		}
		/**
		 * @param writer the writer to set
		 */
		public void setWriter(String writer) {
			this.writer = writer;
		}
		/**
		 * @return the contents
		 */
		public String getContents() {
			return contents;
		}
		/**
		 * @param contents the contents to set
		 */
		public void setContents(String contents) {
			this.contents = contents;
		}
		/**
		 * @return the reg_date
		 */
		public Date getReg_date() {
			return reg_date;
		}
		/**
		 * @param reg_date the reg_date to set
		 */
		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}

}
