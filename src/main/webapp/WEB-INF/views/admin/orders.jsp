<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container-fluid px-4">
    <nav class="nav nav-pills gap-2 mb-4 py-2 border-bottom">
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-1"></i>Dashboard</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/products"><i class="bi bi-grid me-1"></i>Produits</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/categories"><i class="bi bi-tags me-1"></i>Catégories</a>
        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/orders" style="background:#3d1a00; color:#c9a84c;"><i class="bi bi-bag-check me-1"></i>Commandes</a>
        <a class="nav-link text-dark ms-auto" href="${pageContext.request.contextPath}/"><i class="bi bi-arrow-left me-1"></i>Boutique</a>
    </nav>

    <h4 class="fw-bold mb-4"><i class="bi bi-bag-check me-2" style="color:#c9a84c;"></i>Gestion des Commandes</h4>

    <div class="card border-0 shadow-sm">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>N° Commande</th>
                            <th>Client</th>
                            <th>Articles</th>
                            <th>Montant</th>
                            <th>Paiement</th>
                            <th>Statut</th>
                            <th>Date</th>
                            <th>Changer Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>
                                    <a href="${pageContext.request.contextPath}/orders/${order.id}"
                                       style="color:#c9a84c; font-weight:600; text-decoration:none;">
                                        ${order.orderNumber}
                                    </a>
                                </td>
                                <td>
                                    <div class="fw-semibold">${order.user.fullName}</div>
                                    <small class="text-muted">${order.user.email}</small>
                                </td>
                                <td>${order.items.size()} article(s)</td>
                                <td class="fw-bold" style="color:#c9a84c;">
                                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
                                </td>
                                <td><small>${order.paymentMethod}</small></td>
                                <td>
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
                                </td>
                                <td>
                                    <small class="text-muted">
                                        ${fn:substring(order.createdAt.toString(), 0, 10)}
                                    </small>
                                </td>
                                <td>
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/orders/${order.id}/status"
                                          class="d-flex gap-1">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <select name="status" class="form-select form-select-sm" style="width:auto;">
                                            <c:forEach var="s" items="${statuses}">
                                                <option value="${s}" ${order.status == s ? 'selected' : ''}>${s.label}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit" class="btn btn-sm"
                                                style="background:#3d1a00; color:#c9a84c;">
                                            <i class="bi bi-check"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
