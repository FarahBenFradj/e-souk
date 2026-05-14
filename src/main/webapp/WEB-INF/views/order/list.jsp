<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <h3 class="mb-4"><i class="bi bi-bag-check me-2" style="color:#c9a84c;"></i>Mes Commandes</h3>

    <c:if test="${empty orders}">
        <div class="text-center py-5">
            <div style="font-size:3rem;">📦</div>
            <p class="text-muted mt-3">Vous n'avez pas encore de commandes.</p>
            <a href="${pageContext.request.contextPath}/products"
               class="btn" style="background:#3d1a00; color:#c9a84c;">
                <i class="bi bi-grid me-2"></i>Parcourir le Catalogue
            </a>
        </div>
    </c:if>

    <div class="row g-3">
        <c:forEach var="order" items="${orders}">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                            <div>
                                <h6 class="fw-bold mb-1" style="color:#c9a84c;">${order.orderNumber}</h6>
                                <p class="text-muted small mb-1">
                                    <i class="bi bi-calendar3 me-1"></i>
                                    ${fn:substring(order.createdAt.toString(), 0, 10)}
                                </p>
                                <p class="mb-0 small">
                                    <i class="bi bi-box-seam me-1"></i>${order.items.size()} article(s)
                                    &bull; <i class="bi bi-wallet2 me-1"></i>${order.paymentMethod}
                                </p>
                            </div>
                            <div class="text-end">
                                <div class="mb-2">
                                    <c:choose>
                                        <c:when test="${order.status == 'EN_ATTENTE'}">
                                            <span class="badge bg-warning text-dark">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'CONFIRME' || order.status == 'EN_PREPARATION'}">
                                            <span class="badge bg-info">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'EXPEDIE'}">
                                            <span class="badge bg-primary">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'LIVRE'}">
                                            <span class="badge bg-success">${order.status.label}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'ANNULE'}">
                                            <span class="badge bg-danger">${order.status.label}</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="fw-bold" style="color:#c9a84c;">
                                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
                                </div>
                                <a href="${pageContext.request.contextPath}/orders/${order.id}"
                                   class="btn btn-sm mt-1" style="background:#3d1a00; color:#c9a84c;">
                                    Détails <i class="bi bi-arrow-right ms-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
