<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold mb-0">
                    <i class="bi bi-${product.id != null ? 'pencil' : 'plus-lg'} me-2" style="color:#c9a84c;"></i>
                    ${product.id != null ? 'Modifier le Produit' : 'Nouveau Produit'}
                </h4>
                <a href="${pageContext.request.contextPath}/admin/products"
                   class="btn btn-sm btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Retour
                </a>
            </div>

            <div class="card border-0 shadow-sm">
                <div class="card-body p-4">
                    <form method="post" action="${pageContext.request.contextPath}/admin/products/save">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <c:if test="${product.id != null}">
                            <input type="hidden" name="id" value="${product.id}">
                        </c:if>

                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label fw-semibold">Nom du produit *</label>
                                <input type="text" name="name" class="form-control"
                                       value="${product.name}" required
                                       placeholder="Ex: Jarre de Nabeul peinte">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Catégorie *</label>
                                <select name="categoryId" class="form-select" required>
                                    <option value="">-- Choisir une catégorie --</option>
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.id}"
                                            ${product.category != null && product.category.id == cat.id ? 'selected' : ''}>
                                            ${cat.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Prix (TND) *</label>
                                <input type="number" name="price" class="form-control"
                                       value="${product.price}" required
                                       step="0.001" min="0.001" placeholder="45.000">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Stock *</label>
                                <input type="number" name="stock" class="form-control"
                                       value="${product.stock != null ? product.stock : 0}"
                                       required min="0">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Artisan</label>
                                <input type="text" name="artisan" class="form-control"
                                       value="${product.artisan}"
                                       placeholder="Nom de l'artisan">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Région</label>
                                <input type="text" name="region" class="form-control"
                                       value="${product.region}"
                                       placeholder="Ex: Nabeul, Sfax, Kairouan">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">URL Image</label>
                                <input type="url" name="imageUrl" class="form-control"
                                       value="${product.imageUrl}"
                                       placeholder="https://...">
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-semibold">Description</label>
                                <textarea name="description" class="form-control" rows="4"
                                          placeholder="Description détaillée du produit...">${product.description}</textarea>
                            </div>

                            <div class="col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="active"
                                           id="chkActive" value="true"
                                           ${product.id == null || product.active ? 'checked' : ''}>
                                    <label class="form-check-label" for="chkActive">Produit actif</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="featured"
                                           id="chkFeatured" value="true"
                                           ${product.featured ? 'checked' : ''}>
                                    <label class="form-check-label" for="chkFeatured">⭐ Produit vedette</label>
                                </div>
                            </div>
                        </div>

                        <!-- Aperçu image -->
                        <c:if test="${not empty product.imageUrl}">
                            <div class="mt-3">
                                <label class="form-label small text-muted">Aperçu image actuelle</label><br>
                                <img src="${product.imageUrl}" alt="aperçu"
                                     style="max-height:120px; border-radius:8px; object-fit:cover;">
                            </div>
                        </c:if>

                        <div class="d-flex gap-3 mt-4">
                            <button type="submit" class="btn fw-bold"
                                    style="background:#3d1a00; color:#c9a84c;">
                                <i class="bi bi-save me-2"></i>Enregistrer
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/products"
                               class="btn btn-outline-secondary">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
