<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="mb-0">
            <i class="bi bi-receipt me-2" style="color:#c9a84c;"></i>
            Commande <span style="color:#c9a84c;">${order.orderNumber}</span>
        </h3>
        <a href="${pageContext.request.contextPath}/orders" class="btn btn-sm btn-outline-secondary">
            <i class="bi bi-arrow-left me-1"></i>Mes commandes
        </a>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <!-- Articles commandés -->
            <div class="card border-0 shadow-sm mb-3">
                <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-box-seam me-2"></i>Articles commandés
                </div>
                <div class="card-body p-0">
                    <c:forEach var="item" items="${order.items}">
                        <div class="d-flex gap-3 p-3 border-bottom">
                            <img src="${item.product.imageUrl}" alt="${item.product.name}"
                                 style="width:70px;height:70px;object-fit:cover;border-radius:8px;flex-shrink:0;">
                            <div class="flex-grow-1">
                                <h6 class="mb-1 fw-semibold">${item.product.name}</h6>
                                <p class="text-muted small mb-0">
                                    <i class="bi bi-person-circle me-1"></i>${item.product.artisan}
                                </p>
                                <p class="text-muted small mb-0">
                                    Quantité : ${item.quantity}
                                    &bull; Prix unitaire :
                                    <fmt:formatNumber value="${item.unitPrice}" pattern="#,##0.000"/> TND
                                </p>
                            </div>
                            <div class="text-end fw-bold" style="color:#c9a84c;">
                                <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.000"/> TND
                            </div>
                        </div>
                    </c:forEach>
                    <div class="p-3 text-end">
                        <strong>Total : </strong>
                        <strong style="color:#c9a84c; font-size:1.1rem;">
                            <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
                        </strong>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <!-- Statut & infos -->
            <div class="card border-0 shadow-sm mb-3">
                <div class="card-header" style="background:#3d1a00; color:#c9a84c;">
                    <i class="bi bi-info-circle me-2"></i>Informations
                </div>
                <div class="card-body">
                    <p class="text-muted small mb-1">Statut</p>
                    <c:choose>
                        <c:when test="${order.status == 'EN_ATTENTE'}">
                            <span class="badge bg-warning text-dark mb-3">${order.status.label}</span>
                        </c:when>
                        <c:when test="${order.status == 'LIVRE'}">
                            <span class="badge bg-success mb-3">${order.status.label}</span>
                        </c:when>
                        <c:when test="${order.status == 'ANNULE'}">
                            <span class="badge bg-danger mb-3">${order.status.label}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-info mb-3">${order.status.label}</span>
                        </c:otherwise>
                    </c:choose>

                    <p class="text-muted small mb-1">Date de commande</p>
                    <p class="mb-3">
                        ${fn:substring(order.createdAt.toString(), 0, 10)}
                    </p>

                    <p class="text-muted small mb-1">Mode de paiement</p>
                    <p class="mb-3">${order.paymentMethod}</p>

                    <p class="text-muted small mb-1">Adresse de livraison</p>
                    <p class="mb-0">${order.shippingAddress}</p>

                    <c:if test="${not empty order.notes}">
                        <p class="text-muted small mb-1 mt-3">Notes</p>
                        <p class="mb-0">${order.notes}</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
