<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container-fluid px-4">
    <!-- Admin nav bar -->
    <nav class="nav nav-pills gap-2 mb-4 py-2 border-bottom">
        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard"
           style="background:#3d1a00; color:#c9a84c;">
            <i class="bi bi-speedometer2 me-1"></i>Dashboard
        </a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/products">
            <i class="bi bi-grid me-1"></i>Produits
        </a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/categories">
            <i class="bi bi-tags me-1"></i>Catégories
        </a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/orders">
            <i class="bi bi-bag-check me-1"></i>Commandes
        </a>
        <a class="nav-link text-dark ms-auto" href="${pageContext.request.contextPath}/">
            <i class="bi bi-arrow-left me-1"></i>Retour à la boutique
        </a>
    </nav>

    <h4 class="mb-4 fw-bold">
        <i class="bi bi-speedometer2 me-2" style="color:#c9a84c;"></i>Tableau de Bord
    </h4>

    <!-- KPI Cards -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100" style="border-left:4px solid #c9a84c !important;">
                <div class="card-body d-flex align-items-center gap-3">
                    <div class="rounded-3 p-3" style="background:#fdf8f0;">
                        <i class="bi bi-grid" style="font-size:1.5rem; color:#c9a84c;"></i>
                    </div>
                    <div>
                        <div style="font-size:2rem; font-weight:700; color:#3d1a00;">${totalProducts}</div>
                        <div class="text-muted small">Produits actifs</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100" style="border-left:4px solid #198754 !important;">
                <div class="card-body d-flex align-items-center gap-3">
                    <div class="rounded-3 p-3 bg-success bg-opacity-10">
                        <i class="bi bi-bag-check" style="font-size:1.5rem; color:#198754;"></i>
                    </div>
                    <div>
                        <div style="font-size:2rem; font-weight:700; color:#3d1a00;">${totalOrders}</div>
                        <div class="text-muted small">Commandes totales</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100" style="border-left:4px solid #0d6efd !important;">
                <div class="card-body d-flex align-items-center gap-3">
                    <div class="rounded-3 p-3 bg-primary bg-opacity-10">
                        <i class="bi bi-people" style="font-size:1.5rem; color:#0d6efd;"></i>
                    </div>
                    <div>
                        <div style="font-size:2rem; font-weight:700; color:#3d1a00;">${totalUsers}</div>
                        <div class="text-muted small">Utilisateurs</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card border-0 shadow-sm h-100" style="border-left:4px solid #c9a84c !important;">
                <div class="card-body d-flex align-items-center gap-3">
                    <div class="rounded-3 p-3" style="background:#fdf8f0;">
                        <i class="bi bi-cash-stack" style="font-size:1.5rem; color:#c9a84c;"></i>
                    </div>
                    <div>
                        <div style="font-size:1.4rem; font-weight:700; color:#3d1a00;">
                            <fmt:formatNumber value="${totalRevenue}" pattern="#,##0.000"/>
                        </div>
                        <div class="text-muted small">Revenu total (TND)</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Alertes -->
    <div class="row g-3 mb-4">
        <c:if test="${pendingOrders > 0}">
            <div class="col-auto">
                <div class="alert alert-warning py-2 mb-0">
                    <i class="bi bi-clock me-2"></i>
                    <strong>${pendingOrders}</strong> commande(s) en attente de traitement
                    <a href="${pageContext.request.contextPath}/admin/orders" class="alert-link ms-2">Voir →</a>
                </div>
            </div>
        </c:if>
        <c:if test="${lowStock > 0}">
            <div class="col-auto">
                <div class="alert alert-danger py-2 mb-0">
                    <i class="bi bi-exclamation-triangle me-2"></i>
                    <strong>${lowStock}</strong> produit(s) avec stock faible (&lt; 5)
                    <a href="${pageContext.request.contextPath}/admin/products" class="alert-link ms-2">Voir →</a>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Dernières commandes -->
    <div class="card border-0 shadow-sm">
        <div class="card-header d-flex justify-content-between align-items-center"
             style="background:#3d1a00; color:#c9a84c;">
            <span><i class="bi bi-clock-history me-2"></i>Dernières Commandes</span>
            <a href="${pageContext.request.contextPath}/admin/orders"
               class="btn btn-sm" style="background:#c9a84c; color:#000;">Tout voir</a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>N°</th><th>Client</th><th>Articles</th>
                            <th>Montant</th><th>Statut</th><th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${recentOrders}">
                            <tr>
                                <td><small style="color:#c9a84c;" class="fw-semibold">${order.orderNumber}</small></td>
                                <td>${order.user.fullName}</td>
                                <td>${order.items.size()}</td>
                                <td class="fw-semibold">
                                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status == 'EN_ATTENTE'}">
                                            <span class="badge bg-warning text-dark">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'LIVRE'}">
                                            <span class="badge bg-success">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'ANNULE'}">
                                            <span class="badge bg-danger">${order.status.label}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-info">${order.status.label}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><small class="text-muted">
                                    ${fn:substring(order.createdAt.toString(), 0, 10)}
                                </small></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
