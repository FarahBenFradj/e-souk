<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="text-center mb-4">
                <span style="font-size:2.5rem;">🏺</span>
                <h3 class="fw-bold mt-2" style="font-family:'Georgia',serif;">
                    Rejoindre E-<span style="color:#c9a84c;">Souk</span>
                </h3>
                <p class="text-muted small">Créez votre compte pour commander</p>
            </div>

            <div class="card border-0 shadow">
                <div class="card-body p-4">
                    <h5 class="card-title mb-4 text-center">Inscription</h5>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger py-2 small">${error}</div>
                    </c:if>

                    <form method="post" action="${pageContext.request.contextPath}/register">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div class="row g-3">
                            <div class="col-6">
                                <label class="form-label small fw-semibold">Prénom</label>
                                <input type="text" name="firstName" class="form-control"
                                       placeholder="Sami" required>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-semibold">Nom</label>
                                <input type="text" name="lastName" class="form-control"
                                       placeholder="Ben Ali" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Email</label>
                                <input type="email" name="email" class="form-control"
                                       placeholder="votre@email.com" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Téléphone</label>
                                <input type="tel" name="phone" class="form-control"
                                       placeholder="+216 XX XXX XXX">
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Mot de passe</label>
                                <input type="password" name="password" class="form-control"
                                       placeholder="Au moins 6 caractères" required minlength="6">
                            </div>
                            <div class="col-12">
                                <label class="form-label small fw-semibold">Confirmer le mot de passe</label>
                                <input type="password" name="confirmPassword" class="form-control"
                                       placeholder="Répétez le mot de passe" required>
                            </div>
                        </div>

                        <button type="submit" class="btn w-100 fw-bold mt-4"
                                style="background:#3d1a00; color:#c9a84c;">
                            <i class="bi bi-person-plus me-2"></i>Créer mon Compte
                        </button>
                    </form>

                    <hr class="my-3">
                    <p class="text-center text-muted small mb-0">
                        Déjà un compte ?
                        <a href="${pageContext.request.contextPath}/login" style="color:#c9a84c;">Se connecter</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
