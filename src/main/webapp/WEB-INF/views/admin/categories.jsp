<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container-fluid px-4">
    <nav class="nav nav-pills gap-2 mb-4 py-2 border-bottom">
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/dashboard"><i class="bi bi-speedometer2 me-1"></i>Dashboard</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/products"><i class="bi bi-grid me-1"></i>Produits</a>
        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/categories" style="background:#3d1a00; color:#c9a84c;"><i class="bi bi-tags me-1"></i>Catégories</a>
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/admin/orders"><i class="bi bi-bag-check me-1"></i>Commandes</a>
        <a class="nav-link text-dark ms-auto" href="${pageContext.request.contextPath}/"><i class="bi bi-arrow-left me-1"></i>Boutique</a>
    </nav>

    <div class="row g-4">
        <!-- Liste catégories -->
        <div class="col-lg-7">
            <h4 class="fw-bold mb-4"><i class="bi bi-tags me-2" style="color:#c9a84c;"></i>Catégories</h4>
            <div class="card border-0 shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Image</th>
                                    <th>Nom</th>
                                    <th>Slug</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cat" items="${categories}">
                                    <tr>
                                        <td>
                                            <img src="${cat.imageUrl}" alt="${cat.name}"
                                                 style="width:45px;height:45px;object-fit:cover;border-radius:6px;">
                                        </td>
                                        <td class="fw-semibold">${cat.name}</td>
                                        <td><code class="small">${cat.slug}</code></td>
                                        <td><small class="text-muted">${cat.description}</small></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Formulaire nouvelle catégorie -->
        <div class="col-lg-5">
            <h4 class="fw-bold mb-4"><i class="bi bi-plus-circle me-2" style="color:#c9a84c;"></i>Nouvelle Catégorie</h4>
            <div class="card border-0 shadow-sm">
                <div class="card-body p-4">
                    <form method="post" action="${pageContext.request.contextPath}/admin/categories/save">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nom *</label>
                            <input type="text" name="name" class="form-control" required
                                   placeholder="Ex: Verrerie & Cristal">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Slug (URL)</label>
                            <input type="text" name="slug" class="form-control"
                                   placeholder="Auto-généré si vide">
                            <div class="form-text">Laisser vide pour générer automatiquement.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Description</label>
                            <textarea name="description" class="form-control" rows="2"
                                      placeholder="Courte description de la catégorie"></textarea>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">URL Image</label>
                            <input type="url" name="imageUrl" class="form-control"
                                   placeholder="https://...">
                        </div>
                        <button type="submit" class="btn w-100 fw-bold"
                                style="background:#3d1a00; color:#c9a84c;">
                            <i class="bi bi-plus-lg me-2"></i>Ajouter la Catégorie
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
