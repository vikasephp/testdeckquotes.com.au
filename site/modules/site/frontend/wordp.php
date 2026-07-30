
<?php 
shell_exec('/usr/bin/libreoffice --headless --convert-to pdf:writer_pdf_Export --outdir /home/admin3/public_html/wordpdf /home/admin3/public_html/wordpdf/proposal123.docx');
echo "Done";
exit;