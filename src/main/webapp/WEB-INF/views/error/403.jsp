<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container text-center py-5">
    <div style="font-size:5rem; color:#c9a84c;">🔒</div>
    <h1 class="display-4 fw-bold mt-3">403</h1>
    <p class="lead text-muted">Accès refusé. Vous n'avez pas les droits nécessaires.</p>
    <a href="${pageContext.request.contextPath}/" class="btn mt-3"
       style="background:#3d1a00; color:#c9a84c;">
        <i class="bi bi-house me-2"></i>Retour à l'Accueil
    </a>
</div>

<%@ include file="../layout/footer.jsp" %>
