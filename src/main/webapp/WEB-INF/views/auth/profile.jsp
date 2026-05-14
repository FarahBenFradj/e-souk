<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <h3 class="mb-4"><i class="bi bi-person-circle me-2" style="color:#c9a84c;"></i>Mon Profil</h3>

            <div class="card border-0 shadow-sm">
                <div class="card-body p-4">
                    <form method="post" action="${pageContext.request.contextPath}/profile">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Prénom</label>
                                <input type="text" name="firstName" class="form-control"
                                       value="${user.firstName}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-semibold">Nom</label>
                                <input type="text" name="lastName" class="form-control"
                                       value="${user.lastName}" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Email</label>
                                <input type="email" class="form-control" value="${user.email}" disabled>
                                <div class="form-text">L'email ne peut pas être modifié.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Téléphone</label>
                                <input type="tel" name="phone" class="form-control"
                                       value="${user.phone}" placeholder="+216 XX XXX XXX">
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Adresse de livraison</label>
                                <textarea name="address" class="form-control" rows="3"
                                          placeholder="Votre adresse complète...">${user.address}</textarea>
                            </div>
                        </div>

                        <div class="d-flex gap-3 mt-4">
                            <button type="submit" class="btn fw-bold"
                                    style="background:#3d1a00; color:#c9a84c;">
                                <i class="bi bi-save me-2"></i>Enregistrer
                            </button>
                            <a href="${pageContext.request.contextPath}/orders"
                               class="btn btn-outline-secondary">
                                <i class="bi bi-bag-check me-2"></i>Mes Commandes
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
