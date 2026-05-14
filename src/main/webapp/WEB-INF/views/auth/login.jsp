<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="text-center mb-4">
                <span style="font-size:2.5rem;">&#127994;</span>
                <h3 class="fw-bold mt-2" style="font-family:'Georgia',serif;">
                    E-<span style="color:#c9a84c;">Souk</span>
                </h3>
                <p class="text-muted small">Connectez-vous pour accéder à votre compte</p>
            </div>

            <div class="card border-0 shadow">
                <div class="card-body p-4">
                    <h5 class="card-title mb-4 text-center">Connexion</h5>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger py-2 small">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            Email ou mot de passe incorrect.
                        </div>
                    </c:if>
                    <c:if test="${param.logout != null}">
                        <div class="alert alert-info py-2 small">
                            Vous avez été déconnecté.
                        </div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success py-2 small">${success}</div>
                    </c:if>

                    <form method="post"
                          action="${pageContext.request.contextPath}/login">
                        <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}">

                        <div class="mb-3">
                            <label class="form-label small fw-semibold">Email</label>
                            <input type="email" name="email"
                                   class="form-control"
                                   placeholder="votre@email.com"
                                   required autofocus>
                        </div>
                        <div class="mb-4">
                            <label class="form-label small fw-semibold">
                                Mot de passe
                            </label>
                            <input type="password" name="password"
                                   class="form-control"
                                   placeholder="••••••••" required>
                        </div>
                        <button type="submit" class="btn w-100 fw-bold"
                                style="background:#3d1a00; color:#c9a84c;">
                            <i class="bi bi-box-arrow-in-right me-2"></i>
                            Se Connecter
                        </button>
                    </form>

                    <hr class="my-3">
                    <p class="text-center text-muted small mb-0">
                        Pas encore de compte ?
                        <a href="${pageContext.request.contextPath}/register"
                           style="color:#c9a84c;">S'inscrire</a>
                    </p>

                    <div class="mt-3 p-2 rounded" style="background:#fdf8f0;">
                        <p class="mb-1 fw-semibold text-muted"
                           style="font-size:0.75rem;">Comptes de démo :</p>
                        <p class="mb-0 text-muted" style="font-size:0.75rem;">
                            Admin : <code>admin@esouk.tn</code> /
                            <code>admin123</code>
                        </p>
                        <p class="mb-0 text-muted" style="font-size:0.75rem;">
                            Client : <code>client@esouk.tn</code> /
                            <code>client123</code>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>