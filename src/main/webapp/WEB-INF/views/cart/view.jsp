<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h3 class="mb-4"><i class="bi bi-bag me-2" style="color:#c9a84c;"></i>Mon Panier</h3>

    <c:choose>
        <c:when test="${cart.totalItems eq 0}">
            <div class="text-center py-5">
                <div style="font-size:4rem;">🛍️</div>
                <h5 class="mt-3 text-muted">Votre panier est vide</h5>
                <p class="text-muted">Parcourez notre catalogue pour découvrir nos artisanats tunisiens.</p>
                <a href="${pageContext.request.contextPath}/products"
                   class="btn mt-2" style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-grid me-2"></i>Découvrir le Catalogue
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="row g-4">
                <!-- Articles -->
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-0">
                            <c:forEach var="item" items="${cart.itemList}">
                                <div class="d-flex gap-3 p-3 border-bottom">
                                    <img src="${item.imageUrl}" alt="${item.productName}"
                                         style="width:80px; height:80px; object-fit:cover; border-radius:8px; flex-shrink:0;">
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1 fw-semibold">${item.productName}</h6>
                                        <p class="text-muted small mb-2">
                                            <i class="bi bi-person-circle me-1"></i>${item.artisan}
                                        </p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <!-- Quantité -->
                                            <form method="post" action="${pageContext.request.contextPath}/cart/update"
                                                  class="d-flex align-items-center gap-1">
                                                <input type="hidden" name="productId" value="${item.productId}">
                                                <div class="input-group input-group-sm" style="width:110px;">
                                                    <button type="button" class="btn btn-outline-secondary btn-qty" data-action="minus">-</button>
                                                    <input type="number" name="quantity" value="${item.quantity}"
                                                           min="1" max="99"
                                                           class="form-control text-center qty-input" style="font-size:0.85rem;">
                                                    <button type="button" class="btn btn-outline-secondary btn-qty" data-action="plus">+</button>
                                                </div>
                                                <button type="submit" class="btn btn-sm btn-outline-secondary ms-1">
                                                    <i class="bi bi-arrow-repeat"></i>
                                                </button>
                                            </form>
                                            <!-- Prix & supprimer -->
                                            <div class="text-end">
                                                <div class="fw-bold" style="color:#c9a84c;">
                                                    <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.000"/> TND
                                                </div>
                                                <form method="post" action="${pageContext.request.contextPath}/cart/remove" class="d-inline">
                                                    <input type="hidden" name="productId" value="${item.productId}">
                                                    <button type="submit" class="btn btn-sm btn-link text-danger p-0" title="Supprimer">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Vider le panier -->
                        <div class="card-footer bg-transparent">
                            <form method="post" action="${pageContext.request.contextPath}/cart/clear">
                                <button type="submit" class="btn btn-sm btn-outline-danger"
                                        onclick="return confirm('Vider le panier ?')">
                                    <i class="bi bi-trash me-1"></i>Vider le panier
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Résumé commande -->
                <div class="col-lg-4">
                    <div class="card border-0 shadow-sm sticky-top" style="top:80px;">
                        <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                            <i class="bi bi-receipt me-2"></i>Résumé de commande
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Articles (${cart.totalItems})</span>
                                <span><fmt:formatNumber value="${cart.totalPrice}" pattern="#,##0.000"/> TND</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Livraison</span>
                                <span class="text-success">Gratuite</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-3">
                                <strong>Total</strong>
                                <strong style="color:#c9a84c; font-size:1.2rem;">
                                    <fmt:formatNumber value="${cart.totalPrice}" pattern="#,##0.000"/> TND
                                </strong>
                            </div>
                            <sec:authorize access="isAuthenticated()">
                                <a href="${pageContext.request.contextPath}/checkout"
                                   class="btn w-100 fw-bold"
                                   style="background:#3d1a00; color:#c9a84c;">
                                    <i class="bi bi-credit-card me-2"></i>Passer la Commande
                                </a>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <a href="${pageContext.request.contextPath}/login"
                                   class="btn w-100 fw-bold"
                                   style="background:#3d1a00; color:#c9a84c;">
                                    <i class="bi bi-box-arrow-in-right me-2"></i>Se connecter pour commander
                                </a>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
document.querySelectorAll('.btn-qty').forEach(btn => {
    btn.addEventListener('click', () => {
        const group = btn.closest('.input-group');
        const input = group.querySelector('.qty-input');
        let val = parseInt(input.value);
        if (btn.dataset.action === 'plus') input.value = val + 1;
        if (btn.dataset.action === 'minus' && val > 1) input.value = val - 1;
    });
});
</script>

<%@ include file="../layout/footer.jsp" %>
