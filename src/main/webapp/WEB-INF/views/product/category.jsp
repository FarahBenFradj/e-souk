<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <!-- Header catégorie -->
    <div class="rounded-3 p-4 mb-4 text-white position-relative overflow-hidden"
         style="background: linear-gradient(135deg,#1a0a00,#3d1a00); min-height:140px;">
        <img src="${category.imageUrl}" alt=""
             style="position:absolute;top:0;left:0;width:100%;height:100%;object-fit:cover;opacity:0.15;">
        <div class="position-relative">
            <h2 style="font-family:'Georgia',serif; color:#f5e6c8;">${category.name}</h2>
            <p style="color:#d4b06a;" class="mb-0">${category.description}</p>
            <span class="badge mt-2" style="background:#c9a84c; color:#000;">${products.size()} produits</span>
        </div>
    </div>

    <div class="row g-3">
        <c:forEach var="product" items="${products}">
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card product-card h-100 border-0 shadow-sm">
                    <img src="${product.imageUrl}" alt="${product.name}"
                         class="card-img-top" style="height:180px; object-fit:cover;">
                    <div class="card-body d-flex flex-column p-3">
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
