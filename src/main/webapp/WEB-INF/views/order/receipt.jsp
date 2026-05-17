<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&family=Nunito:wght@300;400;600&display=swap" rel="stylesheet">

<style>
:root {
  --copper:    #B87333;
  --saffron:   #E8A020;
  --midnight:  #0D1B2A;
  --cream:     #F5ECD7;
  --display:   'Cormorant Garamond', Georgia, serif;
  --body-f:    'Nunito', sans-serif;
}

.receipt-page {
  background: #f7f3ee;
  min-height: 100vh;
  padding: 40px 0;
}

.receipt-card {
  max-width: 680px;
  margin: 0 auto;
  background: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 8px 48px rgba(44,26,14,0.12);
}

/* En-tête du reçu */
.receipt-header {
  background: var(--midnight);
  padding: 36px 40px 28px;
  position: relative;
  overflow: hidden;
}
.receipt-header::after {
  content: '';
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 3px;
  background: linear-gradient(90deg, transparent, var(--saffron), var(--copper), var(--saffron), transparent);
}
.receipt-ornament {
  position: absolute;
  top: 0; right: 0; bottom: 0;
  width: 200px;
  opacity: 0.04;
  background-image: repeating-conic-gradient(from 0deg, #C9A84C 0deg 10deg, transparent 10deg 20deg);
  background-size: 60px 60px;
}
.receipt-brand {
  font-family: var(--display);
  font-size: 2.4rem;
  font-weight: 700;
  color: #fff;
  margin: 0;
  line-height: 1;
}
.receipt-brand span { color: var(--saffron); font-style: italic; }
.receipt-subtitle {
  font-family: var(--body-f);
  font-size: 0.75rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.4);
  margin-top: 4px;
}
.receipt-status-badge {
  display: inline-block;
  margin-top: 16px;
  padding: 6px 18px;
  border-radius: 20px;
  background: rgba(232,160,32,0.15);
  border: 1px solid rgba(232,160,32,0.4);
  color: var(--saffron);
  font-family: var(--body-f);
  font-size: 0.78rem;
  font-weight: 600;
  letter-spacing: 0.08em;
}
.receipt-number-block {
  text-align: right;
}
.receipt-number-label {
  font-family: var(--body-f);
  font-size: 0.68rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.35);
}
.receipt-number {
  font-family: var(--display);
  font-size: 1.2rem;
  font-weight: 700;
  color: var(--saffron);
}
.receipt-date {
  font-family: var(--body-f);
  font-size: 0.78rem;
  color: rgba(255,255,255,0.4);
  margin-top: 4px;
}

/* Body */
.receipt-body { padding: 32px 40px; }

.receipt-section-title {
  font-family: var(--body-f);
  font-size: 0.68rem;
  font-weight: 600;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--copper);
  margin-bottom: 12px;
  padding-bottom: 6px;
  border-bottom: 1px solid #f0e8dc;
}

.receipt-info-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 32px;
}
.receipt-info-box {
  background: #faf6f0;
  border-radius: 10px;
  padding: 16px 18px;
}
.receipt-info-label {
  font-family: var(--body-f);
  font-size: 0.68rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: #aaa;
  margin-bottom: 6px;
}
.receipt-info-value {
  font-family: var(--body-f);
  font-size: 0.9rem;
  color: #2c1a0e;
  font-weight: 500;
  line-height: 1.5;
}

/* Articles */
.receipt-items { margin-bottom: 28px; }

.receipt-item {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 0;
  border-bottom: 1px solid #f5ede0;
}
.receipt-item:last-child { border-bottom: none; }

.receipt-item-img {
  width: 52px; height: 52px;
  border-radius: 8px;
  object-fit: cover;
  flex-shrink: 0;
}
.receipt-item-info { flex: 1; min-width: 0; }
.receipt-item-name {
  font-family: 'Cormorant Garamond', Georgia, serif;
  font-size: 1rem;
  font-weight: 600;
  color: #2c1a0e;
  margin: 0 0 2px;
}
.receipt-item-artisan {
  font-family: var(--body-f);
  font-size: 0.75rem;
  color: #aaa;
}
.receipt-item-qty {
  font-family: var(--body-f);
  font-size: 0.78rem;
  color: var(--copper);
  background: rgba(184,115,51,0.1);
  padding: 2px 10px;
  border-radius: 12px;
  white-space: nowrap;
}
.receipt-item-price {
  font-family: 'Cormorant Garamond', Georgia, serif;
  font-size: 1.1rem;
  font-weight: 700;
  color: #2c1a0e;
  white-space: nowrap;
}

/* Totaux */
.receipt-totals {
  background: #faf6f0;
  border-radius: 12px;
  padding: 20px 22px;
  margin-bottom: 28px;
}
.receipt-total-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 6px 0;
}
.receipt-total-label {
  font-family: var(--body-f);
  font-size: 0.85rem;
  color: #8a6a50;
}
.receipt-total-value {
  font-family: var(--body-f);
  font-size: 0.9rem;
  color: #2c1a0e;
  font-weight: 500;
}
.receipt-total-row.final {
  border-top: 1.5px solid #e8d8c4;
  margin-top: 8px;
  padding-top: 14px;
}
.receipt-total-row.final .receipt-total-label {
  font-family: 'Cormorant Garamond', Georgia, serif;
  font-size: 1.1rem;
  font-weight: 700;
  color: #2c1a0e;
}
.receipt-total-row.final .receipt-total-value {
  font-family: 'Cormorant Garamond', Georgia, serif;
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--copper);
}

/* Actions */
.receipt-actions {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}
.btn-receipt-print {
  flex: 1;
  padding: 13px 24px;
  border-radius: 30px;
  background: var(--midnight);
  color: #fff;
  border: none;
  font-family: var(--body-f);
  font-size: 0.88rem;
  font-weight: 600;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: opacity 0.2s;
  text-decoration: none;
}
.btn-receipt-print:hover { opacity: 0.85; color: #fff; text-decoration: none; }

.btn-receipt-orders {
  flex: 1;
  padding: 12px 24px;
  border-radius: 30px;
  background: transparent;
  color: var(--copper);
  border: 1.5px solid var(--copper);
  font-family: var(--body-f);
  font-size: 0.88rem;
  font-weight: 600;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: background 0.2s, color 0.2s;
  text-decoration: none;
}
.btn-receipt-orders:hover {
  background: var(--copper);
  color: #fff;
  text-decoration: none;
}

/* Footer du reçu */
.receipt-footer {
  background: #faf6f0;
  border-top: 1px solid #f0e8dc;
  padding: 20px 40px;
  text-align: center;
}
.receipt-footer p {
  font-family: var(--body-f);
  font-size: 0.75rem;
  color: #bbb;
  margin: 0;
  line-height: 1.8;
}
.receipt-footer strong { color: var(--copper); }

/* ── PRINT STYLES ─────────────────────────────────── */
@media print {
  body * { visibility: hidden; }
  .receipt-card, .receipt-card * { visibility: visible; }
  .receipt-card {
    position: absolute; top: 0; left: 0;
    box-shadow: none;
    border-radius: 0;
    max-width: 100%;
    width: 100%;
  }
  .receipt-actions { display: none !important; }
  nav, footer, .container > *:not(.receipt-page), main > *:not(.receipt-page) {
    display: none !important;
  }
  .receipt-page { padding: 0; background: #fff; }
  @page { margin: 1cm; }
}
</style>

<div class="receipt-page">
  <div class="receipt-card" id="receiptCard">

    <!-- ── EN-TÊTE ─────────────────────────────────── -->
    <div class="receipt-header">
      <div class="receipt-ornament"></div>
      <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
        <div>
          <h1 class="receipt-brand">E-<span>Souk</span></h1>
          <p class="receipt-subtitle">Boutique d'Artisanat Tunisien</p>
          <span class="receipt-status-badge">
            ✓ Commande Confirmée
          </span>
        </div>
        <div class="receipt-number-block">
          <p class="receipt-number-label">Reçu N°</p>
          <p class="receipt-number">${order.orderNumber}</p>
          <p class="receipt-date">
            ${formattedDate}
          </p>
        </div>
      </div>
    </div>

    <!-- ── CORPS ──────────────────────────────────── -->
    <div class="receipt-body">

      <!-- Infos client + livraison -->
      <div class="receipt-info-grid">
        <div class="receipt-info-box">
          <p class="receipt-info-label">Client</p>
          <p class="receipt-info-value">
            <strong>${order.user.firstName} ${order.user.lastName}</strong><br>
            ${order.user.email}
            <c:if test="${not empty order.user.phone}"><br>${order.user.phone}</c:if>
          </p>
        </div>
        <div class="receipt-info-box">
          <p class="receipt-info-label">Livraison à</p>
          <p class="receipt-info-value">${order.shippingAddress}</p>
        </div>
        <div class="receipt-info-box">
          <p class="receipt-info-label">Mode de paiement</p>
          <p class="receipt-info-value">
            <c:choose>
              <c:when test="${order.paymentMethod == 'LIVRAISON'}">💵 Paiement à la livraison</c:when>
              <c:when test="${order.paymentMethod == 'VIREMENT'}">🏦 Virement bancaire</c:when>
              <c:when test="${order.paymentMethod == 'CARTE'}">💳 Carte bancaire</c:when>
              <c:otherwise>${order.paymentMethod}</c:otherwise>
            </c:choose>
          </p>
        </div>
        <div class="receipt-info-box">
          <p class="receipt-info-label">Statut de la commande</p>
          <p class="receipt-info-value">
            <c:choose>
              <c:when test="${order.status == 'EN_ATTENTE'}"><span style="color:#E8A020;font-weight:600;">⏳ En attente</span></c:when>
              <c:when test="${order.status == 'CONFIRME'}"><span style="color:#1976d2;font-weight:600;">✅ Confirmé</span></c:when>
              <c:when test="${order.status == 'EXPEDIE'}"><span style="color:#7b1fa2;font-weight:600;">📦 Expédié</span></c:when>
              <c:when test="${order.status == 'LIVRE'}"><span style="color:#388e3c;font-weight:600;">🎉 Livré</span></c:when>
              <c:when test="${order.status == 'ANNULE'}"><span style="color:#d32f2f;font-weight:600;">❌ Annulé</span></c:when>
              <c:otherwise>${order.status}</c:otherwise>
            </c:choose>
          </p>
        </div>
      </div>

      <!-- Articles commandés -->
      <p class="receipt-section-title">Articles commandés (${order.items.size()})</p>
      <div class="receipt-items">
        <c:forEach var="item" items="${order.items}">
          <div class="receipt-item">
            <img class="receipt-item-img"
                 src="${item.product.imageUrl}"
                 alt="${item.product.name}"
                 onerror="this.src='https://via.placeholder.com/52x52/f5ecd7/b87333?text=🏺'">
            <div class="receipt-item-info">
              <p class="receipt-item-name">${item.product.name}</p>
              <p class="receipt-item-artisan">
                par ${item.product.artisan}
                <c:if test="${not empty item.product.region}"> · ${item.product.region}</c:if>
              </p>
            </div>
            <span class="receipt-item-qty">Qté : ${item.quantity}</span>
            <span class="receipt-item-price">
              <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.000"/> TND
            </span>
          </div>
        </c:forEach>
      </div>

      <!-- Totaux -->
      <div class="receipt-totals">
        <div class="receipt-total-row">
          <span class="receipt-total-label">Sous-total</span>
          <span class="receipt-total-value">
            <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
          </span>
        </div>
        <div class="receipt-total-row">
          <span class="receipt-total-label">Livraison</span>
          <span class="receipt-total-value" style="color:#388e3c;">Gratuite</span>
        </div>
        <div class="receipt-total-row">
          <span class="receipt-total-label">TVA</span>
          <span class="receipt-total-value">Incluse</span>
        </div>
        <div class="receipt-total-row final">
          <span class="receipt-total-label">Total payé</span>
          <span class="receipt-total-value">
            <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.000"/> TND
          </span>
        </div>
      </div>

      <c:if test="${not empty order.notes}">
        <div class="receipt-info-box mb-4">
          <p class="receipt-info-label">Note pour le livreur</p>
          <p class="receipt-info-value">${order.notes}</p>
        </div>
      </c:if>

      <!-- Boutons d'action -->
      <div class="receipt-actions">
        <button class="btn-receipt-print" onclick="window.print()">
          <i class="bi bi-printer"></i> Imprimer / Sauvegarder PDF
        </button>
        <a href="${pageContext.request.contextPath}/orders"
           class="btn-receipt-orders">
          <i class="bi bi-bag-check"></i> Mes Commandes
        </a>
        <a href="${pageContext.request.contextPath}/home"
           class="btn-receipt-orders">
          <i class="bi bi-house"></i> Accueil
        </a>
      </div>
    </div>

    <!-- ── FOOTER REÇU ──────────────────────────── -->
    <div class="receipt-footer">
      <p>
        Merci pour votre confiance — <strong>E-Souk</strong> · Artisanat Tunisien Authentique<br>
        contact@esouk.tn · +216 74 000 000 · Avenue Habib Bourguiba, Sfax 3000<br>
        <span style="font-size:0.68rem;">Ce reçu est généré automatiquement et fait foi de votre commande.</span>
      </p>
    </div>

  </div><!-- /receipt-card -->
</div><!-- /receipt-page -->

<script>
// Raccourci clavier Ctrl+P pour imprimer
document.addEventListener('keydown', e => {
  if ((e.ctrlKey || e.metaKey) && e.key === 'p') {
    e.preventDefault();
    window.print();
  }
});
</script>

<%@ include file="../layout/footer.jsp" %>
