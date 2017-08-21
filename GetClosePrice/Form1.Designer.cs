namespace GetClosePrice
{
    partial class Form1
    {
        /// <summary>
        /// 設計工具所需的變數。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清除任何使用中的資源。
        /// </summary>
        /// <param name="disposing">如果應該處置 Managed 資源則為 true，否則為 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 設計工具產生的程式碼

        /// <summary>
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器
        /// 修改這個方法的內容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_download = new System.Windows.Forms.Button();
            this.btn_3big = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.lbl_progress = new System.Windows.Forms.Label();
            this.dt_price = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dt_begin = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dt_end = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // btn_download
            // 
            this.btn_download.Location = new System.Drawing.Point(12, 63);
            this.btn_download.Name = "btn_download";
            this.btn_download.Size = new System.Drawing.Size(75, 23);
            this.btn_download.TabIndex = 0;
            this.btn_download.Text = "Excel下載";
            this.btn_download.UseVisualStyleBackColor = true;
            this.btn_download.Click += new System.EventHandler(this.btn_download_Click);
            // 
            // btn_3big
            // 
            this.btn_3big.Location = new System.Drawing.Point(369, 63);
            this.btn_3big.Name = "btn_3big";
            this.btn_3big.Size = new System.Drawing.Size(75, 23);
            this.btn_3big.TabIndex = 2;
            this.btn_3big.Text = "更新三大";
            this.btn_3big.UseVisualStyleBackColor = true;
            this.btn_3big.Click += new System.EventHandler(this.btn_3big_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(288, 63);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "更新股價";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btn_update_price_Click);
            // 
            // lbl_progress
            // 
            this.lbl_progress.AutoSize = true;
            this.lbl_progress.Location = new System.Drawing.Point(12, 240);
            this.lbl_progress.Name = "lbl_progress";
            this.lbl_progress.Size = new System.Drawing.Size(50, 12);
            this.lbl_progress.TabIndex = 4;
            this.lbl_progress.Text = "待機中...";
            // 
            // dt_price
            // 
            this.dt_price.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dt_price.Location = new System.Drawing.Point(12, 35);
            this.dt_price.Name = "dt_price";
            this.dt_price.Size = new System.Drawing.Size(92, 22);
            this.dt_price.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 12);
            this.label1.TabIndex = 6;
            this.label1.Text = "股價 :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(288, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(75, 12);
            this.label2.TabIndex = 7;
            this.label2.Text = "手動更新DB :";
            // 
            // dt_begin
            // 
            this.dt_begin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dt_begin.Location = new System.Drawing.Point(290, 35);
            this.dt_begin.Name = "dt_begin";
            this.dt_begin.Size = new System.Drawing.Size(92, 22);
            this.dt_begin.TabIndex = 8;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(387, 40);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(11, 12);
            this.label3.TabIndex = 9;
            this.label3.Text = "~";
            // 
            // dt_end
            // 
            this.dt_end.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dt_end.Location = new System.Drawing.Point(404, 35);
            this.dt_end.Name = "dt_end";
            this.dt_end.Size = new System.Drawing.Size(92, 22);
            this.dt_end.TabIndex = 10;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(523, 261);
            this.Controls.Add(this.dt_end);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dt_begin);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dt_price);
            this.Controls.Add(this.lbl_progress);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btn_3big);
            this.Controls.Add(this.btn_download);
            this.Name = "Form1";
            this.Text = "Stock資訊";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_download;
        private System.Windows.Forms.Button btn_3big;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label lbl_progress;
        private System.Windows.Forms.DateTimePicker dt_price;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dt_begin;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dt_end;
    }
}

