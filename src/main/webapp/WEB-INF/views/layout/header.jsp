<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle != null ? pageTitle : 'E-Souk'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/esouk.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background:#1a0a00;">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/">
            <span style="font-size:1.5rem;">&#127994;</span>
            <span class="fw-bold" style="font-family:'Georgia',serif; letter-spacing:1px;">
                E-<span style="color:#c9a84c;">Souk</span>
            </span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMain">
            <form class="d-flex mx-auto" method="get"
                  action="${pageContext.request.contextPath}/search" style="width:35%;">
                <input class="form-control rounded-start rounded-0" type="search" name="q"
                       placeholder="Rechercher..." value="${keyword}">
                <button class="btn" style="background:#c9a84c; border-radius:0 4px 4px 0;">
                    <i class="bi bi-search text-dark"></i>
                </button>
            </form>

            <ul class="navbar-nav ms-auto align-items-center gap-1">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/products">
                        <i class="bi bi-grid"></i> Catalogue
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link position-relative" href="${pageContext.request.contextPath}/cart">
                        <i class="bi bi-bag"></i>
                        <c:if test="${cart.totalItems gt 0}">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill"
                                  style="background:#c9a84c; color:#000; font-size:0.65rem;">
                                ${cart.totalItems}
                            </span>
                        </c:if>
                    </a>
                </li>

                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle"></i>
                            <sec:authentication property="name"/>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/profile">
                                <i class="bi bi-person me-2"></i>Mon Profil</a></li>
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/orders">
                                <i class="bi bi-bag-check me-2"></i>Mes Commandes</a></li>
                            <sec:authorize access="hasRole('ADMIN')">
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-warning"
                                       href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="bi bi-shield-lock me-2"></i>Administration</a></li>
                            </sec:authorize>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form method="post"
                                      action="${pageContext.request.contextPath}/logout">
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}">
                                    <button class="dropdown-item text-danger" type="submit">
                                        <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/login">
                            <i class="bi bi-person"></i> Connexion
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-sm ms-1"
                           href="${pageContext.request.contextPath}/register"
                           style="background:#c9a84c; color:#000;">S'inscrire</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>

<div style="background:#2d1500; border-bottom:1px solid #5a3000;">
    <div class="container">
        <div class="d-flex gap-3 py-2 overflow-auto" style="white-space:nowrap;">
            <a href="${pageContext.request.contextPath}/categories/poterie"
               class="text-decoration-none small" style="color:#d4b06a;">Poterie</a>
            <a href="${pageContext.request.contextPath}/categories/tissage"
               class="text-decoration-none small" style="color:#d4b06a;">Tissage</a>
            <a href="${pageContext.request.contextPath}/categories/bijoux"
               class="text-decoration-none small" style="color:#d4b06a;">Bijoux</a>
            <a href="${pageContext.request.contextPath}/categories/bois"
               class="text-decoration-none small" style="color:#d4b06a;">Bois</a>
            <a href="${pageContext.request.contextPath}/categories/cuir"
               class="text-decoration-none small" style="color:#d4b06a;">Maroquinerie</a>
            <a href="${pageContext.request.contextPath}/categories/parfumerie"
               class="text-decoration-none small" style="color:#d4b06a;">Parfumerie</a>
        </div>
    </div>
</div>

<div class="container mt-2">
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show py-2" role="alert">
            <i class="bi bi-check-circle-fill me-2"></i>${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show py-2" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
</div>

<main class="py-3">