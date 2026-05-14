package com.esouk.config;

import com.esouk.model.Category;
import com.esouk.model.Product;
import com.esouk.model.User;
import com.esouk.repository.CategoryRepository;
import com.esouk.repository.ProductRepository;
import com.esouk.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import java.math.BigDecimal;
import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class DataInitializer implements CommandLineRunner {

    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) {
        if (categoryRepository.count() > 0) return;

        log.info("🌿 Initialisation des données E-Souk...");

        // === Catégories ===
        Category poterie = categoryRepository.save(Category.builder()
                .name("Poterie & Céramique").slug("poterie")
                .description("L'art de la céramique tunisienne, héritage millénaire")
                .imageUrl("https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=400")
                .build());

        Category tissage = categoryRepository.save(Category.builder()
                .name("Tissage & Textiles").slug("tissage")
                .description("Tapis, burnous, chèches et broderies traditionnels")
                .imageUrl("https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400")
                .build());

        Category bijoux = categoryRepository.save(Category.builder()
                .name("Bijoux & Argent").slug("bijoux")
                .description("Bijoux berbères en argent, filigrane de Sfax et Tunis")
                .imageUrl("https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=400")
                .build());

        Category bois = categoryRepository.save(Category.builder()
                .name("Bois & Marqueterie").slug("bois")
                .description("Objets sculptés en bois d'olivier et marqueterie de Tunis")
                .imageUrl("https://images.unsplash.com/photo-1558618047-f4e0dc9e2f27?w=400")
                .build());

        Category cuir = categoryRepository.save(Category.builder()
                .name("Maroquinerie").slug("cuir")
                .description("Maroquinerie artisanale de Sfax et Kairouan")
                .imageUrl("https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400")
                .build());

        Category parfumerie = categoryRepository.save(Category.builder()
                .name("Parfumerie & Huiles").slug("parfumerie")
                .description("Huiles essentielles, eau de fleur d'oranger, jasmin")
                .imageUrl("https://images.unsplash.com/photo-1541643600914-78b084683702?w=400")
                .build());

        // === Produits ===
        List<Product> products = List.of(
            // Poterie
            Product.builder().name("Jarre de Nabeul peinte").price(new BigDecimal("45.000"))
                .description("Jarre en argile peinte à la main par les artisans de Nabeul. Motifs géométriques et floraux traditionnels.")
                .stock(12).artisan("Mohamed Ben Ali").region("Nabeul").category(poterie).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=500").build(),
            Product.builder().name("Service à tajine 6 personnes").price(new BigDecimal("120.000"))
                .description("Service complet : tajine central + 6 assiettes. Cuisson traditionnelle au bois, émaux naturels.")
                .stock(5).artisan("Fatima Cherif").region("Nabeul").category(poterie).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1590794056226-79ef3a8147e1?w=500").build(),
            Product.builder().name("Vase bleu de Carthage").price(new BigDecimal("28.500"))
                .description("Vase traditionnel bleu turquoise, symbole de l'artisanat carthaginois.")
                .stock(20).artisan("Hamid Zouari").region("Nabeul").category(poterie).active(true)
                .imageUrl("https://images.unsplash.com/photo-1612528443702-f6741f70a049?w=500").build(),

            // Tissage
            Product.builder().name("Tapis de Kairouan (handira)").price(new BigDecimal("350.000"))
                .description("Tapis noué à la main par les maîtresses-tisseuses de Kairouan. 150×200 cm, laine mérinos.")
                .stock(3).artisan("Khadija Maatoug").region("Kairouan").category(tissage).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500").build(),
            Product.builder().name("Chèche en coton naturel").price(new BigDecimal("18.000"))
                .description("Chèche traditionnel tunisien, coton naturel 100%, tissé sur métier artisanal.")
                .stock(30).artisan("Ali Troudi").region("Sfax").category(tissage).active(true)
                .imageUrl("https://images.unsplash.com/photo-1601924994987-69e26d50dc26?w=500").build(),
            Product.builder().name("Broderie berbère encadrée").price(new BigDecimal("55.000"))
                .description("Broderie aux points de croix sur lin, motifs berbères du Jendouba. Encadrée.")
                .stock(8).artisan("Néjiba Haddad").region("Jendouba").category(tissage).active(true)
                .imageUrl("https://images.unsplash.com/photo-1617791160505-6f00504e3519?w=500").build(),

            // Bijoux
            Product.builder().name("Collier filigrane de Sfax").price(new BigDecimal("85.000"))
                .description("Collier en argent 925, travail de filigrane traditionnel de Sfax. Motifs floraux.")
                .stock(15).artisan("Ons Jemli").region("Sfax").category(bijoux).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=500").build(),
            Product.builder().name("Main de Fatma (Khamsa) en argent").price(new BigDecimal("42.000"))
                .description("Pendentif main de Fatma en argent massif, symbole de protection porte-bonheur.")
                .stock(25).artisan("Tarek Bejaoui").region("Tunis").category(bijoux).active(true)
                .imageUrl("https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=500").build(),

            // Bois
            Product.builder().name("Plateau en bois d'olivier sculpté").price(new BigDecimal("38.000"))
                .description("Plateau de service sculpté à la main en bois d'olivier de Sfax. Diamètre 35 cm.")
                .stock(18).artisan("Salah Mejri").region("Sfax").category(bois).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=500").build(),
            Product.builder().name("Coffret marqueterie tunis").price(new BigDecimal("62.000"))
                .description("Coffret en bois de cèdre décoré de marqueterie géométrique, art mozarabe tunisois.")
                .stock(7).artisan("Mounir Ayari").region("Tunis").category(bois).active(true)
                .imageUrl("https://images.unsplash.com/photo-1558618047-f4e0dc9e2f27?w=500").build(),

            // Cuir
            Product.builder().name("Sac à main en cuir tanné").price(new BigDecimal("95.000"))
                .description("Sac en cuir naturel tanné à la manière traditionnelle, couture sellière à la main.")
                .stock(10).artisan("Boutheina Ghanmi").region("Sfax").category(cuir).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500").build(),
            Product.builder().name("Babouches brodées or").price(new BigDecimal("35.000"))
                .description("Babouches en cuir naturel, brodées à l'or fin. Tailles 36 à 44 disponibles.")
                .stock(22).artisan("Sonia Dridi").region("Kairouan").category(cuir).active(true)
                .imageUrl("https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500").build(),

            // Parfumerie
            Product.builder().name("Eau de fleur d'oranger 250ml").price(new BigDecimal("12.500"))
                .description("Eau de fleur d'oranger pure, distillée traditionnellement à Nabeul. 100% naturelle.")
                .stock(50).artisan("Coopérative de Nabeul").region("Nabeul").category(parfumerie).active(true)
                .imageUrl("https://images.unsplash.com/photo-1541643600914-78b084683702?w=500").build(),
            Product.builder().name("Coffret huiles essentielles (5×10ml)").price(new BigDecimal("48.000"))
                .description("Coffret 5 huiles: jasmin, rose, lavande, néroli, géranium. Distillation artisanale.")
                .stock(15).artisan("Herboristerie Ben Youssef").region("Tunis").category(parfumerie).featured(true).active(true)
                .imageUrl("https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=500").build()
        );

        productRepository.saveAll(products);

        // === Utilisateurs ===
        if (!userRepository.existsByEmail("admin@esouk.tn")) {
            userRepository.save(User.builder()
                    .firstName("Admin").lastName("E-Souk")
                    .email("admin@esouk.tn")
                    .password(passwordEncoder.encode("admin123"))
                    .role(User.Role.ADMIN).active(true).build());
        }

        if (!userRepository.existsByEmail("client@esouk.tn")) {
            userRepository.save(User.builder()
                    .firstName("Sami").lastName("Trabelsi")
                    .email("client@esouk.tn")
                    .password(passwordEncoder.encode("client123"))
                    .phone("+216 55 123 456")
                    .address("12 Rue de la République, Sfax 3000")
                    .role(User.Role.CLIENT).active(true).build());
        }

        log.info("✅ {} catégories, {} produits et {} utilisateurs initialisés.",
                categoryRepository.count(), productRepository.count(), userRepository.count());
    }
}
