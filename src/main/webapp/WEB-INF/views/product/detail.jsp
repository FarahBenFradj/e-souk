<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" style="color:#c9a84c;">Accueil</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products" style="color:#c9a84c;">Catalogue</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/categories/${product.category.slug}" style="color:#c9a84c;">${product.category.name}</a></li>
            <li class="breadcrumb-item active">${product.name}</li>
        </ol>
    </nav>

    <div class="row g-5">
        <!-- Image -->
        <div class="col-md-6">
            <div class="rounded-3 overflow-hidden shadow" style="max-height:500px;">
                <img src="${product.imageUrl}" alt="${product.name}"
                     class="w-100" style="object-fit:cover; max-height:500px;">
            </div>
            <c:if test="${product.featured}">
                <div class="mt-2">
                    <span class="badge px-3 py-2" style="background:#c9a84c; color:#000;">
                        ⭐ Produit Vedette
                    </span>
                </div>
            </c:if>
        </div>

        <!-- Infos -->
        <div class="col-md-6">
            <p class="text-muted small mb-1">${product.category.name}</p>
            <h2 class="fw-bold mb-2" style="font-family:'Georgia',serif;">${product.name}</h2>

            <div class="d-flex gap-3 mb-3">
                <c:if test="${not empty product.artisan}">
                    <span class="badge bg-light text-dark border">
                        <i class="bi bi-person-circle me-1" style="color:#c9a84c;"></i>${product.artisan}
                    </span>
                </c:if>
                <c:if test="${not empty product.region}">
                    <span class="badge bg-light text-dark border">
                        <i class="bi bi-geo-alt me-1" style="color:#c9a84c;"></i>${product.region}
                    </span>
                </c:if>
            </div>

            <div class="mb-3">
                <span style="font-size:2rem; font-weight:700; color:#c9a84c;">
                    <fmt:formatNumber value="${product.price}" pattern="#,##0.000"/> TND
                </span>
            </div>

            <!-- Stock -->
            <div class="mb-3">
                <c:choose>
                    <c:when test="${product.stock > 10}">
                        <span class="text-success"><i class="bi bi-check-circle-fill me-1"></i>En stock (${product.stock} disponibles)</span>
                    </c:when>
                    <c:when test="${product.stock > 0}">
                        <span class="text-warning"><i class="bi bi-exclamation-circle-fill me-1"></i>Stock limité (${product.stock} restants)</span>
                    </c:when>
                    <c:otherwise>
                        <span class="text-danger"><i class="bi bi-x-circle-fill me-1"></i>Rupture de stock</span>
                    </c:otherwise>
                </c:choose>
            </div>

            <p class="text-muted mb-4" style="line-height:1.8;">${product.description}</p>

            <!-- Ajout au panier -->
            <c:if test="${product.stock > 0}">
                <form method="post" action="${pageContext.request.contextPath}/cart/add" class="mb-3">
                    <input type="hidden" name="productId" value="${product.id}">
                    <div class="d-flex gap-3 align-items-center">
                        <div class="input-group" style="width:130px;">
                            <button type="button" class="btn btn-outline-secondary btn-quantity" data-action="minus">-</button>
                            <input type="number" name="quantity" id="qty" value="1" min="1" max="${product.stock}"
                                   class="form-control text-center">
                            <button type="button" class="btn btn-outline-secondary btn-quantity" data-action="plus">+</button>
                        </div>
                        <button type="submit" class="btn btn-lg flex-grow-1"
                                style="background:#3d1a00; color:#c9a84c; font-weight:600;">
                            <i class="bi bi-bag-plus me-2"></i>Ajouter au Panier
                        </button>
                    </div>
                </form>
            </c:if>

            <!-- Garanties -->
            <div class="row g-2 mt-3">
                <div class="col-4 text-center p-2 rounded" style="background:#fdf8f0;">
                    <i class="bi bi-shield-check" style="color:#c9a84c; font-size:1.3rem;"></i>
                    <p class="mb-0 small mt-1">Authentifié</p>
                </div>
                <div class="col-4 text-center p-2 rounded" style="background:#fdf8f0;">
                    <i class="bi bi-truck" style="color:#c9a84c; font-size:1.3rem;"></i>
                    <p class="mb-0 small mt-1">Livraison rapide</p>
                </div>
                <div class="col-4 text-center p-2 rounded" style="background:#fdf8f0;">
                    <i class="bi bi-arrow-counterclockwise" style="color:#c9a84c; font-size:1.3rem;"></i>
                    <p class="mb-0 small mt-1">Retour 14j</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Produits similaires -->
    <c:if test="${not empty similarProducts}">
        <hr class="my-5">
        <h4 class="mb-4">Vous aimerez aussi</h4>
        <div class="row g-3">
            <c:forEach var="p" items="${similarProducts}">
                <div class="col-6 col-md-3">
                    <div class="card product-card h-100 border-0 shadow-sm">
                        <img src="${p.imageUrl}" alt="${p.name}"
                             class="card-img-top" style="height:140px; object-fit:cover;">
                        <div class="card-body p-3">
                            <h6 class="fw-semibold small">${p.name}</h6>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <span style="color:#c9a84c; font-weight:700;">
                                    <fmt:formatNumber value="${p.price}" pattern="#,##0.000"/> TND
                                </span>
                                <a href="${pageContext.request.contextPath}/products/${p.id}"
                                   class="btn btn-sm" style="background:#3d1a00; color:#c9a84c;">Voir</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>

<script>
document.querySelectorAll('.btn-quantity').forEach(btn => {
    btn.addEventListener('click', () => {
        const input = document.getElementById('qty');
        let val = parseInt(input.value);
        const max = parseInt(input.max);
        if (btn.dataset.action === 'plus' && val < max) input.value = val + 1;
        if (btn.dataset.action === 'minus' && val > 1) input.value = val - 1;
    });
});
</script>

<%@ include file="../layout/footer.jsp" %>
