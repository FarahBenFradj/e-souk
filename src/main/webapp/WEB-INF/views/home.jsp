<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="layout/header.jsp" %>

<!-- ═══ GOOGLE FONTS ═══════════════════════════════════════ -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;0,700;1,400;1,600&family=Nunito:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
/* ── HERO VARIABLES ─────────────────────────────────── */
:root {
  --copper:    #B87333;
  --saffron:   #E8A020;
  --terracotta:#C4622D;
  --midnight:  #0D1B2A;
  --cream:     #F5ECD7;
  --gold:      #C9A84C;
  --display:   'Cormorant Garamond', Georgia, serif;
  --body:      'Nunito', sans-serif;
}

/* ── HERO ──────────────────────────────────────────── */
.hero-souk {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  background: var(--midnight);
}

/* Image de fond */
.hero-bg {
  position: absolute;
  inset: 0;
  background-image: url('${pageContext.request.contextPath}/images/souk.png');
  background-size: cover;
  background-position: center 30%;
  transform: scale(1.05);
  animation: slowZoom 18s ease-in-out infinite alternate;
}

@keyframes slowZoom {
  from { transform: scale(1.05); }
  to   { transform: scale(1.12); }
}

/* Overlay dégradé multicouches */
.hero-overlay {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(to top,   rgba(13,27,42,0.97) 0%,  rgba(13,27,42,0.5) 40%, transparent 70%),
    linear-gradient(to right, rgba(13,27,42,0.7)  0%,  transparent 60%),
    linear-gradient(to bottom, rgba(13,27,42,0.6) 0%,  transparent 30%);
}

/* Motif géométrique arabesque */
.hero-pattern {
  position: absolute;
  inset: 0;
  opacity: 0.045;
  background-image:
    repeating-conic-gradient(from 0deg, #C9A84C 0deg 10deg, transparent 10deg 20deg),
    repeating-conic-gradient(from 45deg at 50px 50px, #C9A84C 0deg 10deg, transparent 10deg 20deg);
  background-size: 80px 80px, 80px 80px;
  pointer-events: none;
}

/* Bordure ornementale top */
.hero-ornament-top {
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 4px;
  background: linear-gradient(90deg, transparent, var(--saffron), var(--copper), var(--gold), transparent);
}
.hero-ornament-bottom {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 4px;
  background: linear-gradient(90deg, transparent, var(--copper), var(--saffron), var(--gold), transparent);
}

/* Contenu hero */
.hero-content {
  position: relative;
  z-index: 10;
  text-align: center;
  padding: 0 20px;
  max-width: 860px;
}

/* Pré-titre */
.hero-pretitle {
  font-family: var(--body);
  font-weight: 300;
  letter-spacing: 0.35em;
  text-transform: uppercase;
  color: var(--saffron);
  font-size: 0.78rem;
  margin-bottom: 20px;
  opacity: 0;
  animation: fadeUp 0.8s ease forwards 0.3s;
}

/* Titre principal */
.hero-title {
  font-family: var(--display);
  font-weight: 700;
  font-size: clamp(3.2rem, 8vw, 7rem);
  line-height: 1.0;
  color: var(--cream);
  margin-bottom: 12px;
  opacity: 0;
  animation: fadeUp 0.9s ease forwards 0.55s;
}

.hero-title span {
  font-style: italic;
  color: var(--saffron);
}

/* Sous-titre arabe */
.hero-arabic {
  font-family: var(--display);
  font-size: clamp(1.4rem, 3vw, 2.2rem);
  color: var(--copper);
  letter-spacing: 0.08em;
  margin-bottom: 16px;
  opacity: 0;
  animation: fadeUp 0.9s ease forwards 0.75s;
}

/* Tagline */
.hero-tagline {
  font-family: var(--body);
  font-size: 1.05rem;
  color: rgba(245,236,215,0.75);
  font-weight: 300;
  letter-spacing: 0.04em;
  margin-bottom: 44px;
  opacity: 0;
  animation: fadeUp 0.9s ease forwards 0.95s;
}

/* Barre de recherche hero */
.hero-search {
  position: relative;
  max-width: 580px;
  margin: 0 auto 36px;
  opacity: 0;
  animation: fadeUp 0.9s ease forwards 1.1s;
}

.hero-search input {
  width: 100%;
  padding: 18px 140px 18px 28px;
  border-radius: 60px;
  border: 1px solid rgba(200,168,76,0.45);
  background: rgba(13,27,42,0.7);
  backdrop-filter: blur(16px);
  color: var(--cream);
  font-family: var(--body);
  font-size: 1rem;
  outline: none;
  transition: border-color 0.3s, box-shadow 0.3s;
}
.hero-search input::placeholder { color: rgba(245,236,215,0.4); }
.hero-search input:focus {
  border-color: var(--saffron);
  box-shadow: 0 0 0 3px rgba(232,160,32,0.18);
}
.hero-search-btn {
  position: absolute;
  right: 6px; top: 6px; bottom: 6px;
  padding: 0 28px;
  border-radius: 60px;
  border: none;
  background: linear-gradient(135deg, var(--saffron), var(--copper));
  color: var(--midnight);
  font-family: var(--body);
  font-weight: 600;
  font-size: 0.88rem;
  letter-spacing: 0.06em;
  cursor: pointer;
  transition: opacity 0.25s, transform 0.2s;
}
.hero-search-btn:hover { opacity: 0.88; transform: scale(0.98); }

/* Boutons CTA */
.hero-ctas {
  display: flex;
  gap: 16px;
  justify-content: center;
  flex-wrap: wrap;
  opacity: 0;
  animation: fadeUp 0.9s ease forwards 1.25s;
}

.btn-souk-primary {
  padding: 14px 38px;
  border-radius: 60px;
  background: linear-gradient(135deg, var(--saffron), var(--copper));
  color: var(--midnight);
  font-family: var(--body);
  font-weight: 600;
  font-size: 0.92rem;
  letter-spacing: 0.08em;
  text-decoration: none;
  border: none;
  cursor: pointer;
  transition: transform 0.22s, box-shadow 0.22s;
}
.btn-souk-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 36px rgba(232,160,32,0.38);
  color: var(--midnight);
  text-decoration: none;
}

.btn-souk-outline {
  padding: 13px 36px;
  border-radius: 60px;
  background: transparent;
  color: var(--cream);
  font-family: var(--body);
  font-weight: 400;
  font-size: 0.92rem;
  letter-spacing: 0.08em;
  text-decoration: none;
  border: 1px solid rgba(245,236,215,0.4);
  cursor: pointer;
  transition: border-color 0.22s, background 0.22s;
}
.btn-souk-outline:hover {
  border-color: var(--saffron);
  background: rgba(232,160,32,0.1);
  color: var(--cream);
  text-decoration: none;
}

/* Scroll indicator */
.hero-scroll {
  position: absolute;
  bottom: 32px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  opacity: 0;
  animation: fadeIn 1s ease forwards 1.8s;
}
.hero-scroll span {
  font-family: var(--body);
  font-size: 0.7rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: rgba(245,236,215,0.4);
}
.hero-scroll-line {
  width: 1px;
  height: 48px;
  background: linear-gradient(to bottom, var(--saffron), transparent);
  animation: scrollPulse 2s ease-in-out infinite;
}
@keyframes scrollPulse {
  0%, 100% { opacity: 0.4; transform: scaleY(1); }
  50% { opacity: 1; transform: scaleY(1.15); }
}

/* Stats flottantes */
.hero-stats {
  position: absolute;
  bottom: 60px;
  right: 48px;
  z-index: 10;
  display: flex;
  flex-direction: column;
  gap: 12px;
  opacity: 0;
  animation: fadeIn 1s ease forwards 1.5s;
}
.hero-stat {
  text-align: right;
}
.hero-stat-number {
  font-family: var(--display);
  font-size: 1.9rem;
  font-weight: 700;
  color: var(--saffron);
  line-height: 1;
}
.hero-stat-label {
  font-family: var(--body);
  font-size: 0.68rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: rgba(245,236,215,0.45);
}

@media (max-width: 768px) {
  .hero-stats { display: none; }
  .hero-souk { min-height: 92vh; }
}

/* ── ANIMATIONS ────────────────────────────────────── */
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(28px); }
  to   { opacity: 1; transform: translateY(0); }
}
@keyframes fadeIn {
  from { opacity: 0; }
  to   { opacity: 1; }
}

/* ── SECTION CATEGORIES ────────────────────────────── */
.section-souk {
  padding: 80px 0;
  background: #faf6f0;
}
.section-title-souk {
  font-family: var(--display);
  font-size: 2.6rem;
  font-weight: 700;
  color: #2c1a0e;
  text-align: center;
  margin-bottom: 8px;
}
.section-title-souk em {
  font-style: italic;
  color: var(--copper);
}
.section-sub {
  font-family: var(--body);
  text-align: center;
  color: #8a6a50;
  font-size: 0.92rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  margin-bottom: 48px;
}

/* Category tiles */
.cat-tile {
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  height: 200px;
  cursor: pointer;
  text-decoration: none;
  display: block;
}
.cat-tile img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.7s ease;
}
.cat-tile:hover img { transform: scale(1.08); }
.cat-tile-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(to top, rgba(13,27,42,0.88) 0%, rgba(13,27,42,0.2) 60%, transparent 100%);
  transition: background 0.4s;
}
.cat-tile:hover .cat-tile-overlay {
  background: linear-gradient(to top, rgba(184,115,51,0.85) 0%, rgba(13,27,42,0.3) 70%, transparent 100%);
}
.cat-tile-info {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  padding: 20px 18px 18px;
}
.cat-tile-name {
  font-family: var(--display);
  font-size: 1.3rem;
  font-weight: 700;
  color: #fff;
  margin-bottom: 0;
}
.cat-tile-count {
  font-family: var(--body);
  font-size: 0.72rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--saffron);
  opacity: 0;
  transform: translateY(6px);
  transition: opacity 0.3s, transform 0.3s;
}
.cat-tile:hover .cat-tile-count { opacity: 1; transform: translateY(0); }

/* ── PRODUITS VEDETTES ─────────────────────────────── */
.products-souk { background: #fff; padding: 80px 0; }

.product-card-souk {
  border: none;
  border-radius: 14px;
  overflow: hidden;
  background: #fff;
  box-shadow: 0 2px 16px rgba(44,26,14,0.07);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  position: relative;
}
.product-card-souk:hover {
  transform: translateY(-6px);
  box-shadow: 0 16px 48px rgba(184,115,51,0.2);
}
.product-img-wrap {
  position: relative;
  height: 220px;
  overflow: hidden;
}
.product-img-wrap img {
  width: 100%; height: 100%; object-fit: cover;
  transition: transform 0.4s ease;
}
.product-card-souk:hover .product-img-wrap img { transform: scale(1.05); }

.quick-view-btn {
  position: absolute;
  bottom: 12px; left: 50%; transform: translateX(-50%) translateY(8px);
  background: rgba(13,27,42,0.85);
  backdrop-filter: blur(8px);
  color: var(--cream);
  border: 1px solid rgba(200,168,76,0.4);
  border-radius: 30px;
  padding: 7px 22px;
  font-family: var(--body);
  font-size: 0.78rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  white-space: nowrap;
  text-decoration: none;
  opacity: 0;
  transition: opacity 0.25s, transform 0.25s;
}
.product-card-souk:hover .quick-view-btn {
  opacity: 1; transform: translateX(-50%) translateY(0);
}

.product-badge {
  position: absolute;
  top: 12px; right: 12px;
  background: linear-gradient(135deg, var(--saffron), var(--copper));
  color: var(--midnight);
  font-family: var(--body);
  font-size: 0.65rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  padding: 4px 12px;
  border-radius: 20px;
}

.product-body-souk { padding: 18px 18px 20px; }
.product-category-tag {
  font-family: var(--body);
  font-size: 0.68rem;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--copper);
  margin-bottom: 6px;
}
.product-name-souk {
  font-family: var(--display);
  font-size: 1.12rem;
  font-weight: 600;
  color: #2c1a0e;
  margin-bottom: 4px;
  line-height: 1.3;
}
.product-artisan-souk {
  font-family: var(--body);
  font-size: 0.78rem;
  color: #8a6a50;
  margin-bottom: 14px;
}
.product-artisan-souk i { color: var(--saffron); }
.product-price-souk {
  font-family: var(--display);
  font-size: 1.4rem;
  font-weight: 700;
  color: var(--terracotta);
}
.product-price-souk small {
  font-size: 0.72rem;
  font-family: var(--body);
  color: #aaa;
  margin-left: 4px;
}
.btn-add-cart {
  padding: 9px 20px;
  border-radius: 30px;
  border: 1.5px solid var(--copper);
  background: transparent;
  color: var(--copper);
  font-family: var(--body);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.06em;
  cursor: pointer;
  transition: background 0.25s, color 0.25s;
  text-decoration: none;
  display: inline-block;
}
.btn-add-cart:hover {
  background: var(--copper);
  color: #fff;
  text-decoration: none;
}

/* ── ARTISANS SPOTLIGHT ────────────────────────────── */
.artisans-souk {
  background: #1a0e07;
  padding: 80px 0;
  overflow: hidden;
}
.artisans-souk .section-title-souk { color: var(--cream); }
.artisans-souk .section-sub { color: rgba(245,236,215,0.45); }

.artisan-scroll {
  display: flex;
  gap: 24px;
  overflow-x: auto;
  padding: 8px 24px 16px;
  scrollbar-width: thin;
  scrollbar-color: var(--copper) transparent;
}
.artisan-scroll::-webkit-scrollbar { height: 4px; }
.artisan-scroll::-webkit-scrollbar-thumb { background: var(--copper); border-radius: 2px; }

.artisan-card {
  min-width: 200px;
  background: rgba(255,255,255,0.06);
  border: 1px solid rgba(200,168,76,0.18);
  border-radius: 14px;
  padding: 24px 20px;
  text-align: center;
  transition: background 0.3s, border-color 0.3s;
  flex-shrink: 0;
}
.artisan-card:hover {
  background: rgba(200,168,76,0.1);
  border-color: rgba(200,168,76,0.45);
}
.artisan-avatar {
  width: 72px; height: 72px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--saffron);
  margin: 0 auto 12px;
  display: block;
}
.artisan-name {
  font-family: var(--display);
  font-size: 1.05rem;
  font-weight: 600;
  color: var(--cream);
  margin-bottom: 3px;
}
.artisan-region {
  font-family: var(--body);
  font-size: 0.72rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--saffron);
  margin-bottom: 8px;
}
.artisan-stars { color: var(--saffron); font-size: 0.75rem; }

/* ── BANNER VALEURS ────────────────────────────────── */
.values-souk {
  background: linear-gradient(135deg, #1a0e07, #2c1a0e);
  padding: 60px 0;
}
.value-item { text-align: center; padding: 20px; }
.value-icon { font-size: 2rem; margin-bottom: 12px; }
.value-label {
  font-family: var(--display);
  font-size: 1.05rem;
  font-weight: 600;
  color: var(--cream);
  margin-bottom: 4px;
}
.value-desc {
  font-family: var(--body);
  font-size: 0.8rem;
  color: rgba(245,236,215,0.5);
  letter-spacing: 0.04em;
}

/* stagger animation pour produits */
.stagger-item {
  opacity: 0;
  animation: fadeUp 0.6s ease forwards;
}
.stagger-item:nth-child(1) { animation-delay: 0.1s; }
.stagger-item:nth-child(2) { animation-delay: 0.22s; }
.stagger-item:nth-child(3) { animation-delay: 0.34s; }
.stagger-item:nth-child(4) { animation-delay: 0.46s; }
.stagger-item:nth-child(5) { animation-delay: 0.58s; }
.stagger-item:nth-child(6) { animation-delay: 0.70s; }
.stagger-item:nth-child(7) { animation-delay: 0.82s; }
.stagger-item:nth-child(8) { animation-delay: 0.94s; }
</style>

<!-- ══════════════════════════════════════════════════ -->
<!--  HERO SECTION                                      -->
<!-- ══════════════════════════════════════════════════ -->
<section class="hero-souk">
  <div class="hero-bg"></div>
  <div class="hero-overlay"></div>
  <div class="hero-pattern"></div>
  <div class="hero-ornament-top"></div>
  <div class="hero-ornament-bottom"></div>

  <!-- Contenu central -->
  <div class="hero-content">
    <p class="hero-pretitle">Artisanat Authentique Tunisien</p>

    <h1 class="hero-title">
      Bienvenue au<br>
      <span>E-Souk</span>
    </h1>

    <p class="hero-arabic">السوق الإلكتروني التونسي</p>

    <p class="hero-tagline">
      Des mains d'artisans tunisiens à votre porte —<br>
      Poterie, Bijoux, Tapis, Bois et plus encore.
    </p>

    <!-- Barre de recherche -->
    <div class="hero-search">
      <form method="get" action="${pageContext.request.contextPath}/search">
        <input type="text" name="q" placeholder="Rechercher un artisanat, un artisan, une région...">
        <button type="submit" class="hero-search-btn">
          <i class="bi bi-search me-1"></i> Chercher
        </button>
      </form>
    </div>

    <!-- CTA Buttons -->
    <div class="hero-ctas">
      <a href="${pageContext.request.contextPath}/products" class="btn-souk-primary">
        Découvrir le Catalogue
      </a>
      <a href="${pageContext.request.contextPath}/categories/poterie" class="btn-souk-outline">
        Explorer les Catégories
      </a>
    </div>
  </div>

  <!-- Stats flottantes droite -->
  <div class="hero-stats">
    <div class="hero-stat">
      <div class="hero-stat-number">14+</div>
      <div class="hero-stat-label">Produits</div>
    </div>
    <div class="hero-stat">
      <div class="hero-stat-number">6</div>
      <div class="hero-stat-label">Catégories</div>
    </div>
    <div class="hero-stat">
      <div class="hero-stat-number">24</div>
      <div class="hero-stat-label">Gouvernorats</div>
    </div>
  </div>

  <!-- Scroll indicator -->
  <div class="hero-scroll">
    <div class="hero-scroll-line"></div>
    <span>Défiler</span>
  </div>
</section>

<!-- ══════════════════════════════════════════════════ -->
<!--  VALEURS                                           -->
<!-- ══════════════════════════════════════════════════ -->
<section class="values-souk">
  <div class="container">
    <div class="row g-0">
      <div class="col-6 col-md-3">
        <div class="value-item">
          <div class="value-icon">🏺</div>
          <div class="value-label">100% Artisanal</div>
          <div class="value-desc">Fait main par des maîtres artisans</div>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="value-item">
          <div class="value-icon">🚚</div>
          <div class="value-label">Livraison Gratuite</div>
          <div class="value-desc">Partout en Tunisie</div>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="value-item">
          <div class="value-icon">🔒</div>
          <div class="value-label">Paiement Sécurisé</div>
          <div class="value-desc">Livraison, virement ou carte</div>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="value-item">
          <div class="value-icon">↩️</div>
          <div class="value-label">Retour 14 Jours</div>
          <div class="value-desc">Satisfait ou remboursé</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ══════════════════════════════════════════════════ -->
<!--  CATÉGORIES                                        -->
<!-- ══════════════════════════════════════════════════ -->
<section class="section-souk" id="categories">
  <div class="container">
    <p class="section-sub">Explorer par univers</p>
    <h2 class="section-title-souk mb-4">Nos <em>Catégories</em></h2>

    <div class="row g-3">
      <c:forEach var="cat" items="${categories}">
        <div class="col-6 col-md-4 col-lg-2">
          <a href="${pageContext.request.contextPath}/categories/${cat.slug}" class="cat-tile">
            <img src="${cat.imageUrl}" alt="${cat.name}" loading="lazy">
            <div class="cat-tile-overlay"></div>
            <div class="cat-tile-info">
              <p class="cat-tile-name">${cat.name}</p>
              <p class="cat-tile-count">Voir les produits →</p>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<!-- ══════════════════════════════════════════════════ -->
<!--  PRODUITS VEDETTES                                 -->
<!-- ══════════════════════════════════════════════════ -->
<section class="products-souk">
  <div class="container">
    <p class="section-sub">Sélection de la semaine</p>
    <h2 class="section-title-souk mb-2">Produits <em>Vedettes</em></h2>

    <div class="d-flex justify-content-end mb-4">
      <a href="${pageContext.request.contextPath}/products"
         style="font-family:var(--body,'Nunito');font-size:0.85rem;color:var(--copper,#B87333);text-decoration:none;letter-spacing:0.06em;">
        Voir tout le catalogue →
      </a>
    </div>

    <div class="row g-4">
      <c:forEach var="product" items="${featuredProducts}" varStatus="loop">
        <div class="col-6 col-md-4 col-lg-3 stagger-item">
          <div class="product-card-souk">
            <div class="product-img-wrap">
              <img src="${product.imageUrl}" alt="${product.name}" loading="lazy">
              <c:if test="${product.featured}">
                <span class="product-badge">⭐ Vedette</span>
              </c:if>
              <a href="${pageContext.request.contextPath}/products/${product.id}"
                 class="quick-view-btn">Voir le produit</a>
            </div>
            <div class="product-body-souk">
              <p class="product-category-tag">${product.category.name}</p>
              <h6 class="product-name-souk">${product.name}</h6>
              <p class="product-artisan-souk">
                <i class="bi bi-person-circle"></i> ${product.artisan}
                <c:if test="${not empty product.region}">
                  &nbsp;·&nbsp;<i class="bi bi-geo-alt"></i> ${product.region}
                </c:if>
              </p>
              <div class="d-flex align-items-center justify-content-between">
                <div class="product-price-souk">
                  <fmt:formatNumber value="${product.price}" pattern="#,##0.000"/>
                  <small>TND</small>
                </div>
                <form method="post"
                      action="${pageContext.request.contextPath}/cart/add"
                      style="margin:0;">
                  <input type="hidden" name="productId" value="${product.id}">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add-cart">
                    <i class="bi bi-bag-plus"></i>
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<!-- ══════════════════════════════════════════════════ -->
<!--  ARTISANS SPOTLIGHT                                -->
<!-- ══════════════════════════════════════════════════ -->
<section class="artisans-souk">
  <div class="container">
    <p class="section-sub" style="color:rgba(245,236,215,0.4);">Les mains derrière chaque pièce</p>
    <h2 class="section-title-souk mb-4">Nos <em>Artisans</em></h2>
  </div>
  <div class="artisan-scroll px-4">
    <c:set var="artisanData" value="${[
      ['Mohamed Ben Ali','Nabeul','Poterie','https://randomuser.me/api/portraits/men/32.jpg'],
      ['Fatima Cherif','Kairouan','Tissage','https://randomuser.me/api/portraits/women/44.jpg'],
      ['Hamid Zouari','Sfax','Bijoux','https://randomuser.me/api/portraits/men/51.jpg'],
      ['Khadija Maatoug','Tunis','Bois','https://randomuser.me/api/portraits/women/68.jpg'],
      ['Ali Troudi','Sfax','Maroquinerie','https://randomuser.me/api/portraits/men/77.jpg'],
      ['Salah Mejri','Nabeul','Parfumerie','https://randomuser.me/api/portraits/men/88.jpg']
    ]}"/>
    <!-- Artisans statiques car extraits des données de démo -->
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/men/32.jpg" alt="Mohamed">
      <p class="artisan-name">Mohamed Ben Ali</p>
      <p class="artisan-region">Nabeul</p>
      <div class="artisan-stars">★★★★★</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/women/44.jpg" alt="Fatima">
      <p class="artisan-name">Fatima Cherif</p>
      <p class="artisan-region">Kairouan</p>
      <div class="artisan-stars">★★★★★</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/men/51.jpg" alt="Hamid">
      <p class="artisan-name">Hamid Zouari</p>
      <p class="artisan-region">Sfax</p>
      <div class="artisan-stars">★★★★☆</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/women/68.jpg" alt="Khadija">
      <p class="artisan-name">Khadija Maatoug</p>
      <p class="artisan-region">Tunis</p>
      <div class="artisan-stars">★★★★★</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/men/77.jpg" alt="Ali">
      <p class="artisan-name">Ali Troudi</p>
      <p class="artisan-region">Sfax</p>
      <div class="artisan-stars">★★★★☆</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/men/88.jpg" alt="Salah">
      <p class="artisan-name">Salah Mejri</p>
      <p class="artisan-region">Nabeul</p>
      <div class="artisan-stars">★★★★★</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/women/29.jpg" alt="Ons">
      <p class="artisan-name">Ons Jemli</p>
      <p class="artisan-region">Sfax</p>
      <div class="artisan-stars">★★★★★</div>
    </div>
    <div class="artisan-card">
      <img class="artisan-avatar" src="https://randomuser.me/api/portraits/men/62.jpg" alt="Mounir">
      <p class="artisan-name">Mounir Ayari</p>
      <p class="artisan-region">Tunis</p>
      <div class="artisan-stars">★★★★☆</div>
    </div>
  </div>
</section>

<%@ include file="layout/footer.jsp" %>
