<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="mb-4">
        <h4>
            <i class="bi bi-search me-2" style="color:#c9a84c;"></i>
            Résultats pour "<strong>${keyword}</strong>"
        </h4>
        <p class="text-muted">${resultCount} article(s) trouvé(s)</p>
    </div>

    <c:if test="${empty products}">
        <div class="text-center py-5">
            <div style="font-size:3rem;">😕</div>
            <p class="text-muted mt-2">Aucun produit ne correspond à votre recherche.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-sm"
               style="background:#3d1a00; color:#c9a84c;">Voir tout le catalogue</a>
        </div>
    </c:if>

    <div class="row g-3">
        <c:forEach var="product" items="${products}">
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card product-card h-100 border-0 shadow-sm">
                    <img src="${product.imageUrl}" alt="${product.name}"
                         class="card-img-top" style="height:180px; object-fit:cover;">
                    <div class="card-body d-flex flex-column p-3">
                        <p class="text-muted small mb-1">${product.category.name}</p>
                        <h6 class="card-title fw-semibold mb-1" style="font-size:0.9rem;">${product.name}</h6>
                        <p class="text-muted small mb-0"><i class="bi bi-person-circle me-1"></i>${product.artisan}</p>
                        <div class="d-flex justify-content-between align-items-center mt-auto pt-2">
                            <span class="fw-bold" style="color:#c9a84c;">
                                <fmt:formatNumber value="${product.price}" pattern="#,##0.000"/> TND
                            </span>
                            <a href="${pageContext.request.contextPath}/products/${product.id}"
                               class="btn btn-sm" style="background:#3d1a00; color:#c9a84c;">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
