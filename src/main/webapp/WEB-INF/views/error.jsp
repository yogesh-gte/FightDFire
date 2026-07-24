<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${empty title ? 'Error' : title}"/> — Fight D Fear</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Fraunces:opsz,wght@9..144,600;9..144,700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --ink: #1a1523;
            --muted: #5c5668;
            --line: #e4e0ea;
            --bg: #f7f4f1;
            --card: #ffffff;
            --accent: #c23b4a;
            --accent-soft: #fce8ea;
            --ok: #1f6f5b;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            min-height: 100vh;
            font-family: "DM Sans", system-ui, sans-serif;
            color: var(--ink);
            background:
                radial-gradient(ellipse 80% 50% at 10% 0%, #f3e6e8 0%, transparent 55%),
                radial-gradient(ellipse 60% 40% at 100% 100%, #e8eee9 0%, transparent 50%),
                var(--bg);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 32px 16px;
        }
        .shell {
            width: 100%;
            max-width: 560px;
        }
        .brand {
            font-family: Fraunces, Georgia, serif;
            font-size: 1.15rem;
            font-weight: 700;
            letter-spacing: -0.02em;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .brand i { color: var(--accent); }
        .panel {
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 16px;
            padding: 36px 32px;
            box-shadow: 0 12px 40px rgba(26, 21, 35, 0.06);
        }
        .status-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: var(--accent);
            background: var(--accent-soft);
            padding: 6px 12px;
            border-radius: 999px;
            margin-bottom: 18px;
        }
        h1 {
            font-family: Fraunces, Georgia, serif;
            font-size: clamp(1.6rem, 4vw, 2rem);
            line-height: 1.2;
            letter-spacing: -0.02em;
            margin-bottom: 12px;
        }
        .lead {
            color: var(--muted);
            font-size: 1.02rem;
            line-height: 1.65;
            margin-bottom: 24px;
        }
        .meta {
            border-top: 1px solid var(--line);
            padding-top: 18px;
            display: grid;
            gap: 10px;
            font-size: 0.88rem;
        }
        .meta-row {
            display: grid;
            grid-template-columns: 110px 1fr;
            gap: 8px;
        }
        .meta-row dt { color: var(--muted); font-weight: 500; }
        .meta-row dd {
            font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
            font-size: 0.82rem;
            word-break: break-word;
            color: var(--ink);
        }
        .details {
            margin-top: 16px;
            border: 1px dashed var(--line);
            border-radius: 10px;
            padding: 12px 14px;
            background: #faf9f8;
        }
        .details summary {
            cursor: pointer;
            font-weight: 600;
            font-size: 0.9rem;
            color: var(--ink);
            list-style: none;
        }
        .details summary::-webkit-details-marker { display: none; }
        .details ul {
            margin-top: 10px;
            padding-left: 18px;
            color: var(--muted);
            font-size: 0.85rem;
            line-height: 1.5;
        }
        .actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 28px;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 11px 18px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 0.95rem;
            text-decoration: none;
            border: 1px solid transparent;
            transition: transform 0.15s ease, background 0.15s ease;
        }
        .btn:hover { transform: translateY(-1px); }
        .btn-primary {
            background: var(--ink);
            color: #fff;
        }
        .btn-primary:hover { background: #2d2438; }
        .btn-ghost {
            background: transparent;
            color: var(--ink);
            border-color: var(--line);
        }
        .btn-ghost:hover { background: #f3f0ed; }
        .safe-note {
            margin-top: 18px;
            font-size: 0.8rem;
            color: var(--ok);
            display: flex;
            align-items: center;
            gap: 6px;
        }
        @media (max-width: 480px) {
            .panel { padding: 28px 20px; }
            .meta-row { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
<c:set var="httpStatus" value="${empty status ? 500 : status}"/>
<div class="shell">
    <div class="brand">
        <i class="bi bi-shield-lock-fill" aria-hidden="true"></i>
        Fight D Fear
    </div>
    <div class="panel" role="alert">
        <div class="status-chip">
            <i class="bi bi-exclamation-triangle-fill" aria-hidden="true"></i>
            HTTP <c:out value="${httpStatus}"/>
            <c:if test="${not empty errorCode}"> · <c:out value="${errorCode}"/></c:if>
        </div>
        <h1><c:out value="${empty title ? 'Something went wrong' : title}"/></h1>
        <p class="lead"><c:out value="${empty message ? 'An unexpected error occurred. Please try again.' : message}"/></p>

        <dl class="meta">
            <c:if test="${not empty exceptionType}">
                <div class="meta-row">
                    <dt>Exception</dt>
                    <dd><c:out value="${exceptionType}"/></dd>
                </div>
            </c:if>
            <c:if test="${not empty exceptionMessage}">
                <div class="meta-row">
                    <dt>Detail</dt>
                    <dd><c:out value="${exceptionMessage}"/></dd>
                </div>
            </c:if>
            <c:if test="${not empty path}">
                <div class="meta-row">
                    <dt>Path</dt>
                    <dd><c:out value="${path}"/></dd>
                </div>
            </c:if>
            <c:if test="${not empty timestamp}">
                <div class="meta-row">
                    <dt>When</dt>
                    <dd><c:out value="${timestamp}"/></dd>
                </div>
            </c:if>
        </dl>

        <c:if test="${showDetails and not empty causeChain}">
            <details class="details">
                <summary>Cause chain</summary>
                <ul>
                    <c:forEach var="c" items="${causeChain}">
                        <li><c:out value="${c}"/></li>
                    </c:forEach>
                </ul>
            </details>
        </c:if>

        <div class="actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/">
                <i class="bi bi-house-door"></i> Home
            </a>
            <a class="btn btn-ghost" href="javascript:history.back()">
                <i class="bi bi-arrow-left"></i> Go back
            </a>
            <a class="btn btn-ghost" href="${pageContext.request.contextPath}/login">
                <i class="bi bi-box-arrow-in-right"></i> Sign in
            </a>
        </div>
        <p class="safe-note">
            <i class="bi bi-check-circle"></i>
            The app recovered safely — this page replaces a crash.
        </p>
    </div>
</div>
</body>
</html>
