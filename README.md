# 🏺 E-Souk — Boutique d'Artisanat Tunisien

Application web e-commerce développée avec **Spring Boot 3** + **JSP** dans le cadre d'un mini-projet JEE.

---

## 📸 Fonctionnalités

| Fonctionnalité | Description |
|---|---|
| 🏠 Accueil | Page vitrine avec produits vedettes et catégories |
| 📦 Catalogue | Liste paginée avec filtres par catégorie |
| 🔍 Recherche | Recherche full-text sur nom, description, artisan |
| 🛍️ Panier | Gestion panier via Session HTTP |
| ✅ Commande | Checkout complet avec confirmation et historique |
| 👤 Profil | Inscription, connexion, édition profil |
| 🛡️ Admin | Dashboard, CRUD produits/catégories, gestion commandes |

---

## 🛠️ Stack Technique

- **Backend :** Spring Boot 3.2, Spring MVC, Spring Security, Spring Data JPA
- **Frontend :** JSP + JSTL, Bootstrap 5, Bootstrap Icons
- **BDD :** H2 (dev/test) · MySQL 8 (production)
- **Sécurité :** BCrypt, Form Login, RBAC (CLIENT / ADMIN)
- **Build :** Maven 3, Java 17
- **VCS :** Git / GitHub

---

## 🚀 Lancer le projet

### Prérequis
- Java 17+
- Maven 3.8+

### Démarrage rapide (H2 en mémoire)

```bash
git clone https://github.com/TON_USERNAME/e-souk.git
cd e-souk
mvn spring-boot:run
```

Accéder à : **http://localhost:8080**

### Comptes de démo

| Rôle | Email | Mot de passe |
|------|-------|--------------|
| 🛡️ Admin | `admin@esouk.tn` | `admin123` |
| 👤 Client | `client@esouk.tn` | `client123` |

### Console H2 (dev)
- URL : http://localhost:8080/h2-console
- JDBC : `jdbc:h2:mem:esoudb`
- User : `sa` / Mot de passe : *(vide)*

---

## 🗄️ Configuration MySQL (Production)

Dans `src/main/resources/application.properties`, décommenter :

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/esoudb?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=VOTRE_MOT_DE_PASSE
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect
spring.jpa.hibernate.ddl-auto=update
spring.h2.console.enabled=false
```

Créer la base :
```sql
CREATE DATABASE esoudb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

---

## 📁 Structure du Projet

```
e-souk/
├── src/main/java/com/esouk/
│   ├── EsoukApplication.java          # Point d'entrée
│   ├── config/
│   │   ├── SecurityConfig.java        # Spring Security
│   │   ├── MvcConfig.java             # Intercepteurs MVC
│   │   ├── CartInterceptor.java       # Injecte panier dans vues
│   │   └── DataInitializer.java       # Données de démo
│   ├── controller/
│   │   ├── HomeController.java        # Page d'accueil
│   │   ├── ProductController.java     # Catalogue & recherche
│   │   ├── CartController.java        # Panier
│   │   ├── OrderController.java       # Commandes & checkout
│   │   ├── AuthController.java        # Login, register, profil
│   │   └── AdminController.java       # Back-office
│   ├── model/
│   │   ├── Product.java               # Entité produit
│   │   ├── Category.java              # Entité catégorie
│   │   ├── User.java                  # Entité utilisateur
│   │   ├── Order.java                 # Entité commande
│   │   └── OrderItem.java             # Ligne de commande
│   ├── dto/
│   │   ├── Cart.java                  # Panier en session
│   │   └── CartItem.java              # Article du panier
│   ├── repository/
│   │   ├── ProductRepository.java
│   │   ├── CategoryRepository.java
│   │   ├── UserRepository.java
│   │   └── OrderRepository.java
│   └── service/
│       ├── ProductService.java
│       ├── CartService.java
│       ├── OrderService.java
│       ├── UserService.java
│       └── UserDetailsServiceImpl.java
├── src/main/webapp/WEB-INF/views/
│   ├── layout/
│   │   ├── header.jsp                 # Navbar + CSS
│   │   └── footer.jsp                 # Pied de page + JS
│   ├── home.jsp                       # Page d'accueil
│   ├── product/
│   │   ├── list.jsp                   # Catalogue
│   │   ├── detail.jsp                 # Fiche produit
│   │   ├── search.jsp                 # Résultats recherche
│   │   └── category.jsp               # Produits par catégorie
│   ├── cart/
│   │   └── view.jsp                   # Panier
│   ├── order/
│   │   ├── checkout.jsp               # Passer commande
│   │   ├── confirmation.jsp           # Confirmation
│   │   ├── list.jsp                   # Mes commandes
│   │   └── detail.jsp                 # Détail commande
│   ├── auth/
│   │   ├── login.jsp
│   │   ├── register.jsp
│   │   └── profile.jsp
│   ├── admin/
│   │   ├── dashboard.jsp
│   │   ├── products.jsp
│   │   ├── product-form.jsp
│   │   ├── orders.jsp
│   │   └── categories.jsp
│   └── error/
│       └── 403.jsp
├── src/main/resources/
│   ├── application.properties
│   └── static/
│       ├── css/esouk.css
│       └── js/esouk.js
└── pom.xml
```

---

## 📌 Publier sur GitHub

```bash
# 1. Initialiser Git
cd e-souk
git init
git add .
git commit -m "feat: initial E-Souk e-commerce project"

# 2. Créer le repo sur GitHub (via interface web ou CLI)
gh repo create e-souk --public --description "Mini-projet JEE : E-commerce artisanat tunisien"

# 3. Pousser
git remote add origin https://github.com/TON_USERNAME/e-souk.git
git branch -M main
git push -u origin main
```

### Workflow Git recommandé

```bash
git checkout -b feature/nom-feature   # Nouvelle fonctionnalité
git add .
git commit -m "feat: description"
git push origin feature/nom-feature
# Créer une Pull Request sur GitHub
```

---

## 🗃️ Modèle de données

```
categories          products                users
─────────           ─────────               ─────
id (PK)             id (PK)                 id (PK)
name                name                    firstName
slug                description             lastName
description         price                   email (unique)
imageUrl            stock                   password (bcrypt)
                    artisan                 phone
                    region                  address
                    imageUrl                role (CLIENT/ADMIN)
                    active                  active
                    featured
                    category_id (FK)

orders              order_items
─────────           ─────────────
id (PK)             id (PK)
orderNumber         order_id (FK)
user_id (FK)        product_id (FK)
totalAmount         quantity
status              unitPrice
shippingAddress
paymentMethod
notes
```

---

## 👥 Auteur

Projet réalisé dans le cadre d'un **Mini-Projet JEE** — Spring Boot + JSP.

> **E-Souk** — L'artisanat tunisien à portée de clic 🇹🇳
