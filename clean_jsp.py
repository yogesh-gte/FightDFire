import re

filepath = r'c:\Users\kisho\OneDrive\Desktop\ws\FightDFire\src\main\webapp\WEB-INF\views\user-profile1.jsp'

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# The CSS we want to keep
clean_css = '''<style>
/* 🌟 User Profile Split Section CSS */
.user-split-section {
	background-color: #f8f9fa;
	padding: 0;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
	margin-bottom: 30px;
}

.user-bg-left {
	background: linear-gradient(135deg, rgba(30, 27, 75, 0.05) 0%, rgba(244, 63, 94, 0.05) 100%);
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	min-height: 400px;
}

.user-details-side {
	background-color: #ffffff;
}

.user-details {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

.user-details h2 {
	font-weight: 800;
	color: #1e1b4b;
	letter-spacing: -0.5px;
}

.user-details ul li {
	font-size: 1.1rem;
	color: #4a4a4a;
	padding: 12px 0;
	border-bottom: 1px dashed #e9ecef;
}

.user-details ul li:last-child {
	border-bottom: none;
}

.user-details ul li i {
	width: 25px;
	text-align: center;
	color: #f43f5e;
}

.user-details ul li strong {
	color: #1e1b4b;
	margin-right: 5px;
}

@media ( max-width : 767.98px) {
	.user-bg-left {
		min-height: 250px;
		border-right: none;
		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	}
	.user-details {
		padding: 2rem !important;
	}
}
</style>'''

# Replace everything from <style> to </style>
new_content = re.sub(r'<style>.*?</style>', clean_css, content, flags=re.DOTALL)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(new_content)

print('Cleaned up user-profile1.jsp CSS')
