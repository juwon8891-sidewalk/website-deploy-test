# add_google_analytics.py

# 파일 읽기
with open("build/web/index.html", "r") as file:
    content = file.read()

# <head> 태그에 Google Analytics 코드 추가
head_tag = '<!-- Google Tag Manager -->\n<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':new Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\'https://www.googletagmanager.com/gtm.js?id=\'+i+dl;f.parentNode.insertBefore(j,f);})(window,document,\'script\',\'dataLayer\',\'GTM-TK8QNKQQ\');</script>\n<!-- End Google Tag Manager -->\n\n'
modified_content = content.replace("<head>", "<head>\n" + head_tag)

# <body> 태그 바로 뒤에 Google Analytics 코드 추가
body_tag = '<!-- Google Tag Manager (noscript) -->\n<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TK8QNKQQ" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>\n<!-- End Google Tag Manager (noscript) -->\n\n'
modified_content = modified_content.replace("<body>", "<body>\n" + body_tag)

# 수정된 내용 파일에 쓰기
with open("build/web/index.html", "w") as file:
    file.write(modified_content)