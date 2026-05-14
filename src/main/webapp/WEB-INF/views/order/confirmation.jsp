<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7 text-center py-5">
            <div style="font-size:4rem; color:#c9a84c;">✅</div>
            <h2 class="mt-3 fw-bold" style="font-family:'Georgia',serif;">Commande Confirmée !</h2>
            <p class="text-muted lead">Merci pour votre commande. Nos artisans vont préparer votre colis avec soin.</p>

            <div class="card border-0 shadow-sm mt-4 text-start">
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <p class="text-muted small mb-1">Numéro de commande</p>
                            <p class="fw-bold" style="color:#c9a84c;">${order.orderNumber}</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="text-muted small mb-1">Statut</p>
                            <span class="badge bg-warning text-dark">${order.status.label}</span>
                        </div>
                        <div class="col-sm-6">
                            <p class="text-muted small mb-1">Mode de paiement</p>
                            <p class="mb-0">${order.paymentMethod}</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="text-muted small mb-1">Montant total</p>
                            <p class="fw-bold mb-0" style="color:#c9a84c; font-size:1.2rem;">
                                <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
                            </p>
                        </div>
                        <div class="col-12">
                            <p class="text-muted small mb-1">Adresse de livraison</p>
                            <p class="mb-0">${order.shippingAddress}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4 d-flex gap-3 justify-content-center flex-wrap">
                <a href="${pageContext.request.contextPath}/orders/${order.id}"
                   class="btn" style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-bag-check me-2"></i>Voir ma Commande
                </a>
                <a href="${pageContext.request.contextPath}/"
                   class="btn btn-outline-secondary">
                    <i class="bi bi-house me-2"></i>Retour à l'Accueil
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
