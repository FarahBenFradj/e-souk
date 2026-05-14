<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row">
        <!-- Sidebar filtres -->
        <div class="col-lg-3 mb-4">
            <div class="card border-0 shadow-sm sticky-top" style="top:80px;">
                <div class="card-header" style="background:#3d1a00; color:#c9a84c; font-weight:600;">
                    <i class="bi bi-funnel me-2"></i>Filtrer par catégorie
                </div>
                <div class="card-body p-0">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="${pageContext.request.contextPath}/products"
                               class="text-decoration-none d-flex justify-content-between align-items-center
                                      ${categoryId == null ? 'fw-bold' : ''}"
                               style="color:${categoryId == null ? '#c9a84c' : '#3d1a00'}">
                                <span>Tous les produits</span>
                            </a>
                        </li>
                        <c:forEach var="cat" items="${categories}">
                            <li class="list-group-item">
                                <a href="${pageContext.request.contextPath}/categories/${cat.slug}"
                                   class="text-decoration-none d-flex justify-content-between align-items-center
                                          ${selectedCategory != null && selectedCategory.id == cat.id ? 'fw-bold' : ''}"
                                   style="color:${selectedCategory != null && selectedCategory.id == cat.id ? '#c9a84c' : '#3d1a00'}">
                                    <span>${cat.name}</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Produits -->
        <div class="col-lg-9">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="mb-0">
                    <c:choose>
                        <c:when test="${selectedCategory != null}">
                            ${selectedCategory.name}
                        </c:when>
                        <c:otherwise>Tout le Catalogue</c:otherwise>
                    </c:choose>
                    <c:if test="${totalItems != null}">
                        <small class="text-muted fs-6 ms-2">(${totalItems} articles)</small>
                    </c:if>
                </h4>
            </div>

            <c:if test="${empty products}">
                <div class="text-center py-5">
                    <div style="font-size:3rem;">🔍</div>
                    <p class="text-muted mt-2">Aucun produit trouvé dans cette catégorie.</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-sm"
                       style="background:#3d1a00; color:#c9a84c;">Voir tout le catalogue</a>
                </div>
            </c:if>

            <div class="row g-3">
                <c:forEach var="product" items="${products}">
                    <div class="col-6 col-md-4">
                        <div class="card product-card h-100 border-0 shadow-sm">
                            <div class="position-relative overflow-hidden" style="height:180px;">
                                <img src="${product.imageUrl}" alt="${product.name}"
                                     class="w-100 h-100" style="object-fit:cover;">
                                <c:if test="${product.featured}">
                                    <span class="badge position-absolute top-0 end-0 m-2"
                                          style="background:#c9a84c; color:#000;">⭐ Vedette</span>
                                </c:if>
                                <c:if test="${product.stock == 0}">
                                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center"
                                         style="background:rgba(0,0,0,0.5);">
                                        <span class="badge bg-secondary">Rupture de stock</span>
                                    </div>
                                </c:if>
                            </div>
                            <div class="card-body d-flex flex-column p-3">
                                <p class="text-muted small mb-1">${product.category.name}</p>
                                <h6 class="card-title fw-semibold mb-1" style="font-size:0.9rem; line-height:1.3;">${product.name}</h6>
                                <p class="text-muted small mb-0">
                                    <i class="bi bi-person-circle me-1"></i>${product.artisan}
                                </p>
                                <div class="d-flex justify-content-between align-items-center mt-auto pt-2">
                                    <span class="fw-bold" style="color:#c9a84c;">
                                        <fmt:formatNumber value="${product.price}" pattern="#,##0.000"/> TND
                                    </span>
                                    <a href="${pageContext.request.contextPath}/products/${product.id}"
                                       class="btn btn-sm" style="background:#3d1a00; color:#c9a84c;">
                                        Voir
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages != null && totalPages > 1}">
                <nav class="mt-4">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}"
                                   style="${currentPage == i ? 'background:#3d1a00; border-color:#3d1a00;' : 'color:#3d1a00;'}">
                                    ${i + 1}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
