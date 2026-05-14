<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="layout/header.jsp" %>

<!-- HERO BANNER -->
<div class="hero-banner text-white text-center py-5 mb-4"
     style="background: linear-gradient(135deg, #1a0a00 0%, #3d1a00 50%, #1a0a00 100%);
            min-height:420px; display:flex; align-items:center;">
    <div class="container">
        <div class="badge mb-3 px-3 py-2" style="background:#c9a84c; color:#000; font-size:0.85rem; letter-spacing:2px;">
            ARTISANAT TUNISIEN AUTHENTIQUE
        </div>
        <h1 class="display-4 fw-bold mb-3" style="font-family:'Georgia',serif; color:#f5e6c8;">
            Bienvenue au <span style="color:#c9a84c;">E-Souk</span>
        </h1>
        <p class="lead mb-4" style="color:#d4b06a; max-width:600px; margin:0 auto;">
            Découvrez des pièces artisanales uniques fabriquées à la main par les maîtres-artisans de Tunisie.
            De Nabeul à Sfax, de Kairouan à Tunis.
        </p>
        <div class="d-flex gap-3 justify-content-center flex-wrap">
            <a href="${pageContext.request.contextPath}/products"
               class="btn btn-lg px-4" style="background:#c9a84c; color:#000; font-weight:600;">
                <i class="bi bi-grid me-2"></i>Découvrir le Catalogue
            </a>
            <a href="#categories-section"
               class="btn btn-lg btn-outline-light px-4">
                <i class="bi bi-compass me-2"></i>Explorer les Catégories
            </a>
        </div>
        <!-- Statistiques -->
        <div class="row justify-content-center mt-5 g-3">
            <div class="col-auto">
                <div style="color:#c9a84c; font-size:1.8rem; font-weight:700;">500+</div>
                <div style="color:#a08050; font-size:0.8rem;">Produits</div>
            </div>
            <div class="col-auto px-4" style="border-left:1px solid #5a3000; border-right:1px solid #5a3000;">
                <div style="color:#c9a84c; font-size:1.8rem; font-weight:700;">200+</div>
                <div style="color:#a08050; font-size:0.8rem;">Artisans</div>
            </div>
            <div class="col-auto">
                <div style="color:#c9a84c; font-size:1.8rem; font-weight:700;">24</div>
                <div style="color:#a08050; font-size:0.8rem;">Gouvernorats</div>
            </div>
        </div>
    </div>
</div>

<!-- CATÉGORIES -->
<div class="container" id="categories-section">
    <h2 class="section-title text-center mb-4">
        <span style="color:#c9a84c;">Nos</span> Catégories
    </h2>
    <div class="row g-3 mb-5">
        <c:forEach var="cat" items="${categories}">
            <div class="col-6 col-md-4 col-lg-2">
                <a href="${pageContext.request.contextPath}/categories/${cat.slug}"
                   class="card text-center text-decoration-none category-card h-100 border-0 shadow-sm">
                    <div class="card-img-top category-img-wrap">
                        <img src="${cat.imageUrl}" alt="${cat.name}"
                             style="width:100%; height:90px; object-fit:cover; border-radius:8px 8px 0 0;">
                    </div>
                    <div class="card-body py-2 px-1">
                        <p class="mb-0 small fw-semibold" style="color:#3d1a00;">${cat.name}</p>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

<!-- PRODUITS VEDETTES -->
<div style="background:#fdf8f0;" class="py-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="section-title mb-0">
                ✨ Produits <span style="color:#c9a84c;">Vedettes</span>
            </h2>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary btn-sm">
                Voir tout <i class="bi bi-arrow-right ms-1"></i>
            </a>
        </div>
        <div class="row g-4">
            <c:forEach var="product" items="${featuredProducts}">
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="card product-card h-100 border-0 shadow-sm">
                        <div class="position-relative">
                            <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}"
                                 style="height:200px; object-fit:cover;">
                            <span class="badge position-absolute top-0 end-0 m-2"
                                  style="background:#c9a84c; color:#000;">Vedette</span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <p class="text-muted small mb-1">${product.category.name}</p>
                            <h6 class="card-title mb-1 fw-semibold">${product.name}</h6>
                            <p class="text-muted small mb-2 flex-grow-1">
                                <i class="bi bi-person-circle me-1"></i>${product.artisan}
                                <c:if test="${not empty product.region}">
                                    &bull; <i class="bi bi-geo-alt me-1"></i>${product.region}
                                </c:if>
                            </p>
                            <div class="d-flex justify-content-between align-items-center mt-auto">
                                <span class="fw-bold" style="color:#c9a84c; font-size:1.1rem;">
                                    <fmt:formatNumber value="${product.price}" pattern="#,##0.000"/> TND
                                </span>
                                <a href="${pageContext.request.contextPath}/products/${product.id}"
                                   class="btn btn-sm" style="background:#3d1a00; color:#c9a84c;">
                                    Voir <i class="bi bi-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- BANNIÈRE ARTISANS -->
<div class="py-5" style="background: linear-gradient(135deg, #2d1500, #1a0a00);">
    <div class="container text-center">
        <h3 style="color:#f5e6c8; font-family:'Georgia',serif;">Un héritage transmis de génération en génération</h3>
        <p style="color:#a08050;" class="lead mt-2 mb-4">
            Chaque pièce est fabriquée à la main selon des techniques ancestrales tunisiennes.
        </p>
        <div class="row g-4 justify-content-center mt-2">
            <div class="col-md-3 text-center">
                <div style="font-size:2.5rem;">🏺</div>
                <h6 style="color:#c9a84c;" class="mt-2">Poterie de Nabeul</h6>
                <p class="small" style="color:#6a5030;">Argile locale, émaux naturels</p>
            </div>
            <div class="col-md-3 text-center">
                <div style="font-size:2.5rem;">🧵</div>
                <h6 style="color:#c9a84c;" class="mt-2">Tapis de Kairouan</h6>
                <p class="small" style="color:#6a5030;">Laine mérinos, motifs berbères</p>
            </div>
            <div class="col-md-3 text-center">
                <div style="font-size:2.5rem;">💍</div>
                <h6 style="color:#c9a84c;" class="mt-2">Joaillerie de Sfax</h6>
                <p class="small" style="color:#6a5030;">Argent 925, filigrane traditionnel</p>
            </div>
            <div class="col-md-3 text-center">
                <div style="font-size:2.5rem;">🌸</div>
                <h6 style="color:#c9a84c;" class="mt-2">Fleurs de Nabeul</h6>
                <p class="small" style="color:#6a5030;">Eau de rose, jasmin, néroli</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="layout/footer.jsp" %>
