import os
import re

files_to_fix = [
    r'src\main\webapp\WEB-INF\views\chat_window.jsp',
    r'src\main\webapp\WEB-INF\views\friendse.jsp',
    r'src\main\webapp\WEB-INF\views\centreDetails.jsp',
    r'src\main\webapp\WEB-INF\views\enrollmentForm.jsp',
    r'src\main\webapp\WEB-INF\views\enrollmentSuccess.jsp'
]

for filepath in files_to_fix:
    if not os.path.exists(filepath):
        print(f'File not found: {filepath}')
        continue
        
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    if '<div id=\"wrapper\">' in content:
        print(f'Already standardized: {filepath}')
        continue

    header_pattern = re.compile(r'<header id=\"header\"[\s\S]*?</header>', re.IGNORECASE)
    ftco_nav_pattern = re.compile(r'<nav class=\"[^\"]*?ftco_navbar[^\"]*\" id=\"ftco-navbar\"[\s\S]*?</nav>', re.IGNORECASE)
    
    has_header = header_pattern.search(content)
    has_ftco = ftco_nav_pattern.search(content)
    
    if not has_header and not has_ftco:
        print(f'No matching header found in {filepath}')
        continue

    replacement = '''<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper">
        <jsp:include page="/WEB-INF/views/fragments/header.jsp" />'''
        
    if has_header:
        content = header_pattern.sub(replacement, content, count=1)
    elif has_ftco:
        content = ftco_nav_pattern.sub(replacement, content, count=1)

    footer_pattern = re.compile(r'<jsp:include page=\"/WEB-INF/views/fragments/footer\.jsp\" />', re.IGNORECASE)
    footer_html_pattern = re.compile(r'<!-- ======= Footer ======= -->[\s\S]*?</footer>', re.IGNORECASE)
    
    close_tags = '''    </div>
</div>'''

    if footer_pattern.search(content):
        content = footer_pattern.sub(close_tags, content, count=1)
    elif footer_html_pattern.search(content):
        content = footer_html_pattern.sub(close_tags, content, count=1)
    else:
        script_pattern = re.compile(r'<!-- Scripts -->', re.IGNORECASE)
        if script_pattern.search(content):
            content = script_pattern.sub(close_tags + '\n\n<!-- Scripts -->', content, count=1)
        else:
            body_close_pattern = re.compile(r'</body>', re.IGNORECASE)
            content = body_close_pattern.sub(close_tags + '\n</body>', content, count=1)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
        
    print(f'Successfully standardized: {filepath}')
