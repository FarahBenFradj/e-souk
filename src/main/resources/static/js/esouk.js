/* =============================================
   E-Souk — JavaScript Principal
   ============================================= */

document.addEventListener('DOMContentLoaded', () => {

  // Auto-dismiss des alertes après 4 secondes
  document.querySelectorAll('.alert.alert-success, .alert.alert-info').forEach(alert => {
    setTimeout(() => {
      const bsAlert = bootstrap.Alert.getOrCreateInstance(alert);
      bsAlert.close();
    }, 4000);
  });

  // Confirmation avant suppression / actions destructives
  document.querySelectorAll('[data-confirm]').forEach(el => {
    el.addEventListener('click', e => {
      if (!confirm(el.dataset.confirm)) e.preventDefault();
    });
  });

  // Aperçu image en temps réel (admin form)
  const imgUrlInput = document.querySelector('input[name="imageUrl"]');
  if (imgUrlInput) {
    imgUrlInput.addEventListener('blur', () => {
      const url = imgUrlInput.value.trim();
      let preview = document.getElementById('img-preview-live');
      if (!preview && url) {
        preview = document.createElement('img');
        preview.id = 'img-preview-live';
        preview.style.cssText = 'max-height:100px;border-radius:8px;margin-top:8px;object-fit:cover;display:block;';
        imgUrlInput.parentNode.appendChild(preview);
      }
      if (preview) preview.src = url || '';
    });
  }

  // Navbar active link
  const currentPath = window.location.pathname;
  document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
    if (link.getAttribute('href') === currentPath) {
      link.style.color = '#c9a84c';
    }
  });

  // Smooth scroll to anchor
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', e => {
      const target = document.querySelector(anchor.getAttribute('href'));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });

  // Animation d'apparition produits au scroll
  const cards = document.querySelectorAll('.product-card, .category-card');
  if ('IntersectionObserver' in window) {
    const observer = new IntersectionObserver(entries => {
      entries.forEach((entry, i) => {
        if (entry.isIntersecting) {
          entry.target.style.animationDelay = `${i * 0.05}s`;
          entry.target.classList.add('visible');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1 });
    cards.forEach(card => observer.observe(card));
  }

});
