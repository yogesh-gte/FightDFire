<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Registration - Fight D Fear</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <style>
        :root {
            --brand-purple: #7C2D5E;
            --brand-purple-dark: #5E1F47;
            --brand-pink: #DB2777;
            --fdf-border: #e5e7eb;
            --fdf-text: #1e293b;
            --fdf-muted: #64748b;
            --gradient-primary: linear-gradient(135deg, #7C2D5E 0%, #DB2777 100%);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fffcfd;
            padding: 20px;
        }

        .container {
            max-width: 500px;
            width: 100%;
        }

        .card {
            background: white;
            border-radius: 28px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
            padding: 35px 30px;
            border: none;
            width: 100%;
        }

        h3 {
            color: var(--brand-purple);
            font-weight: 800;
            font-size: 1.75rem;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--brand-purple-dark);
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--brand-purple);
            opacity: 0.5;
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px 14px 46px;
            border: 2px solid var(--fdf-border);
            border-radius: 16px;
            background: #f8fafc;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: var(--fdf-text);
        }

        .form-control:focus {
            border-color: var(--brand-pink);
            background: #fff;
            box-shadow: 0 0 0 4px rgba(219, 39, 119, 0.1);
            outline: none;
        }

        .form-control::placeholder {
            color: var(--fdf-muted);
            font-weight: 400;
        }

        .password-toggle-btn {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: var(--brand-purple);
            opacity: 0.5;
            cursor: pointer;
            padding: 4px;
            font-size: 1.1rem;
            z-index: 2;
        }

        .password-toggle-btn:hover {
            opacity: 1;
            color: var(--brand-pink);
        }

        .input-wrapper.password-field .form-control {
            padding-right: 46px;
        }

        .btn-primary {
            width: 100%;
            padding: 16px;
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 18px;
            font-size: 1.1rem;
            font-weight: 800;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            box-shadow: 0 10px 25px rgba(124, 45, 94, 0.25);
            font-family: 'Poppins', sans-serif;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            filter: brightness(1.05);
            box-shadow: 0 15px 30px rgba(124, 45, 94, 0.3);
        }

        .mt-3 {
            margin-top: 1.5rem;
            text-align: center;
        }

        a {
            color: var(--brand-pink);
            text-decoration: none;
            font-weight: 700;
            transition: color 0.2s;
            font-size: 0.95rem;
        }

        a:hover {
            color: var(--brand-purple);
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .card {
                padding: 30px 20px;
                border-radius: 24px;
            }

            h3 {
                font-size: 1.4rem;
            }

            .form-control {
                padding: 12px 16px 12px 42px;
                border-radius: 12px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h3><i class="bi bi-shield-lock"></i> Admin Registration</h3>
        <form action="${pageContext.request.contextPath}/admin/registerAdmin" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <div class="input-wrapper">
                    <i class="bi bi-person"></i>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" class="form-control" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <div class="input-wrapper">
                    <i class="bi bi-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Enter your email" class="form-control" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper password-field">
                    <i class="bi bi-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter your password" class="form-control" 
                           pattern="(?=.*[0-9])(?=.*[!@#$%^&*]).{6,}" 
                           title="At least 6 characters, including a number and a special character" 
                           required autocomplete="new-password">
                    <button type="button" class="password-toggle-btn" id="passwordToggleBtn" aria-label="Show password">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>

            <button type="submit" class="btn-primary">Register</button>
        </form>

        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/admin/loginAdmin">
                <i class="bi bi-arrow-left"></i> Already have an account? Login
            </a>
        </div>
    </div>
</div>

<script>
    const passwordInput = document.getElementById('password');
    const toggleBtn = document.getElementById('passwordToggleBtn');
    const toggleIcon = toggleBtn.querySelector('i');

    toggleBtn.addEventListener('click', () => {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.classList.remove('bi-eye');
            toggleIcon.classList.add('bi-eye-slash');
            toggleBtn.setAttribute('aria-label', 'Hide password');
        } else {
            passwordInput.type = 'password';
            toggleIcon.classList.remove('bi-eye-slash');
            toggleIcon.classList.add('bi-eye');
            toggleBtn.setAttribute('aria-label', 'Show password');
        }
    });
</script>
</body>
</html>