<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container-fluid px-4">
    <nav class="nav nav-pills gap-2 mb-4 py-2 border-bottom">
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-1"></i>Dashboard</a>
        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/products" style="background:#3d1a00; color:#c9a84c;"><i class="bi bi-grid me-1"></i>Produits</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/categories"><i class="bi bi-tags me-1"></i>Catégories</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/orders"><i class="bi bi-bag-check me-1"></i>Commandes</a>
        <a class="nav-link text-dark ms-auto" href="${pageContext.request.contextPath}/"><i class="bi bi-arrow-left me-1"></i>Boutique</a>
    </nav>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold mb-0"><i class="bi bi-grid me-2" style="color:#c9a84c;"></i>Gestion des Produits</h4>
        <a href="${pageContext.request.contextPath}/admin/products/new"
           class="btn" style="background:#3d1a00; color:#c9a84c;">
            <i class="bi bi-plus-lg me-2"></i>Nouveau Produit
        </a>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th style="width:60px;">Image</th>
                            <th>Produit</th>
                            <th>Catégorie</th>
                            <th>Artisan</th>
                            <th>Prix</th>
                            <th>Stock</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${products}">
                            <tr>
                                <td>
                                    <img src="${p.imageUrl}" alt="${p.name}"
                                         style="width:50px;height:50px;object-fit:cover;border-radius:6px;">
                                </td>
                                <td>
                                    <span class="fw-semibold">${p.name}</span>
                                    <c:if test="${p.featured}">
                                        <span class="badge ms-1" style="background:#c9a84c;color:#000;font-size:0.65rem;">⭐</span>
                                    </c:if>
                                </td>
                                <td><small class="text-muted">${p.category.name}</small></td>
                                <td><small>${p.artisan}</small></td>
                                <td class="fw-semibold" style="color:#c9a84c;">
                                    <fmt:formatNumber value="${p.price}" pattern="#,##0.000"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.stock == 0}">
                                            <span class="badge bg-danger">Rupture</span>
                                        </c:when>
                                        <c:when test="${p.stock < 5}">
                                            <span class="badge bg-warning text-dark">${p.stock}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">${p.stock}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.active}">
                                            <span class="badge bg-success">Actif</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Inactif</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="d-flex gap-1">
                                        <a href="${pageContext.request.contextPath}/products/${p.id}"
                                           class="btn btn-sm btn-outline-secondary" target="_blank" title="Voir">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/products/${p.id}/edit"
                                           class="btn btn-sm btn-outline-warning" title="Modifier">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <form method="post" action="${pageContext.request.contextPath}/admin/products/${p.id}/delete"
                                              style="display:inline;"
                                              onsubmit="return confirm('Désactiver ce produit ?')">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <button class="btn btn-sm btn-outline-danger" title="Désactiver">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
