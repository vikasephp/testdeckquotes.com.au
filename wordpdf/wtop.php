 
 <?php
 
 
//$result = exec('"C:\Program Files (x86)\OpenOffice 4\program\python.exe" E:\wamp\www\wordpdf\unoconv-master\unoconv -f pdf -o E:/wamp/www/wordpdf/proposal.pdf E:/wamp/www/wordpdf/proposal.docx');

$result = exec('"C:\\Program Files (x86)\\OpenOffice 4\\program\\python.exe" /home/admin3/public_html/wordpdf/unoconv-master/unoconv -f pdf -o /home/admin3/public_html/wordpdf/proposal.pdf /home/admin3/public_html/wordpdf/proposal.docx');

$result = exec('"/usr/local/bin/python" /home/admin3/public_html/wordpdf/unoconv-master/unoconv -f pdf -o /home/admin3/public_html/wordpdf/proposal.pdf /home/admin3/public_html/wordpdf/proposal.docx');

//$result = exec(BASE_DIR. '/wordpdf/OpenOffice 4/program/python.exe' .BASE_DIR. '/wordpdf/unoconv-master/unoconv -f pdf -o '.BASE_DIR. '/wordpdf/proposal.pdf' .BASE_DIR. '/wordpdf/proposal.docx');

echo "Testing1";
exit;