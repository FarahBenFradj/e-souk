<%@ page contentType="text/html;charset=UTF-8" %>
</main>

<!-- FOOTER -->
<footer style="background:#1a0a00; color:#d4b06a;" class="mt-5 pt-5 pb-3">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <h5 style="font-family:'Georgia',serif;">🏺 E-<span style="color:#c9a84c;">Souk</span></h5>
                <p class="small" style="color:#a08050;">
                    La boutique en ligne de l'artisanat tunisien authentique.
                    Chaque pièce raconte une histoire, chaque artisan perpétue un héritage.
                </p>
                <div class="d-flex gap-3 mt-3">
                    <a href="#" style="color:#c9a84c; font-size:1.3rem;"><i class="bi bi-facebook"></i></a>
                    <a href="#" style="color:#c9a84c; font-size:1.3rem;"><i class="bi bi-instagram"></i></a>
                    <a href="#" style="color:#c9a84c; font-size:1.3rem;"><i class="bi bi-whatsapp"></i></a>
                </div>
            </div>
            <div class="col-md-2">
                <h6 style="color:#c9a84c;">Boutique</h6>
                <ul class="list-unstyled small">
                    <li><a href="${pageContext.request.contextPath}/products" style="color:#a08050; text-decoration:none;">Catalogue</a></li>
                    <li><a href="${pageContext.request.contextPath}/categories/poterie" style="color:#a08050; text-decoration:none;">Poterie</a></li>
                    <li><a href="${pageContext.request.contextPath}/categories/bijoux" style="color:#a08050; text-decoration:none;">Bijoux</a></li>
                    <li><a href="${pageContext.request.contextPath}/categories/tissage" style="color:#a08050; text-decoration:none;">Tissage</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h6 style="color:#c9a84c;">Informations</h6>
                <ul class="list-unstyled small">
                    <li><a href="#" style="color:#a08050; text-decoration:none;">À propos</a></li>
                    <li><a href="#" style="color:#a08050; text-decoration:none;">Nos Artisans</a></li>
                    <li><a href="#" style="color:#a08050; text-decoration:none;">Livraison & Retours</a></li>
                    <li><a href="#" style="color:#a08050; text-decoration:none;">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h6 style="color:#c9a84c;">Contact</h6>
                <ul class="list-unstyled small" style="color:#a08050;">
                    <li><i class="bi bi-geo-alt me-2"></i>Avenue Habib Bourguiba, Nabeul</li>
                    <li><i class="bi bi-telephone me-2"></i>+216 75 000 000</li>
                    <li><i class="bi bi-envelope me-2"></i>contact@esouk.tn</li>
                    <li class="mt-2">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Tunisia.svg/30px-Flag_of_Tunisia.svg.png"
                             alt="Tunisia" class="me-1"> Expédition dans toute la Tunisie
                    </li>
                </ul>
            </div>
        </div>
        <hr style="border-color:#5a3000;" class="mt-4">
        <div class="d-flex justify-content-between align-items-center">
            <small style="color:#6a5030;">© 2026 E-Souk. Tous droits réservés.</small>
            <small style="color:#6a5030;">
                <i class="bi bi-shield-check me-1"></i>Paiement sécurisé
                <i class="bi bi-truck ms-3 me-1"></i>Livraison rapide
                <i class="bi bi-arrow-counterclockwise ms-3 me-1"></i>Retours 14j
            </small>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/esouk.js"></script>
</body>
</html>
