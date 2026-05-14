<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h3 class="mb-4"><i class="bi bi-credit-card me-2" style="color:#c9a84c;"></i>Finaliser la Commande</h3>
    <div class="row g-4">
        <!-- Formulaire -->
        <div class="col-lg-7">
            <form method="post" action="${pageContext.request.contextPath}/checkout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                        <i class="bi bi-geo-alt me-2"></i>Adresse de livraison
                    </div>
                    <div class="card-body">
                        <textarea name="shippingAddress" class="form-control" rows="3"
                                  placeholder="Entrez votre adresse complète de livraison..." required
                        >${user.address}</textarea>
                    </div>
                </div>

                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                        <i class="bi bi-wallet2 me-2"></i>Mode de paiement
                    </div>
                    <div class="card-body">
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="paymentMethod"
                                   value="LIVRAISON" id="pmLiv" checked>
                            <label class="form-check-label" for="pmLiv">
                                <i class="bi bi-cash me-2"></i>Paiement à la livraison (Cash)
                            </label>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="paymentMethod"
                                   value="VIREMENT" id="pmVir">
                            <label class="form-check-label" for="pmVir">
                                <i class="bi bi-bank me-2"></i>Virement bancaire
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod"
                                   value="CARTE" id="pmCarte">
                            <label class="form-check-label" for="pmCarte">
                                <i class="bi bi-credit-card me-2"></i>Carte bancaire
                            </label>
                        </div>
                    </div>
                </div>

                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-body">
                        <label class="form-label text-muted small">Note pour le livreur (optionnel)</label>
                        <textarea name="notes" class="form-control" rows="2"
                                  placeholder="Instructions spéciales..."></textarea>
                    </div>
                </div>

                <button type="submit" class="btn w-100 btn-lg fw-bold"
                        style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-check-circle me-2"></i>Confirmer la Commande
                </button>
            </form>
        </div>

        <!-- Récapitulatif -->
        <div class="col-lg-5">
            <div class="card border-0 shadow-sm sticky-top" style="top:80px;">
                <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-bag me-2"></i>Récapitulatif (${cart.totalItems} article(s))
                </div>
                <div class="card-body p-0">
                    <c:forEach var="item" items="${cart.itemList}">
                        <div class="d-flex gap-2 p-3 border-bottom">
                            <img src="${item.imageUrl}" style="width:50px;height:50px;object-fit:cover;border-radius:6px;flex-shrink:0;" alt="">
                            <div class="flex-grow-1">
                                <p class="mb-0 small fw-semibold">${item.productName}</p>
                                <p class="mb-0 text-muted" style="font-size:0.78rem;">Qté: ${item.quantity}</p>
                            </div>
                            <div class="text-end">
                                <span class="small fw-bold" style="color:#c9a84c;">
                                    <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.000"/> TND
                                </span>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="p-3">
                        <div class="d-flex justify-content-between">
                            <span class="text-muted">Sous-total</span>
                            <span><fmt:formatNumber value="${cart.totalPrice}" pattern="#,##0.000"/> TND</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-muted">Livraison</span>
                            <span class="text-success">Gratuite</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <strong>Total</strong>
                            <strong style="color:#c9a84c; font-size:1.1rem;">
                                <fmt:formatNumber value="${cart.totalPrice}" pattern="#,##0.000"/> TND
                            </strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
