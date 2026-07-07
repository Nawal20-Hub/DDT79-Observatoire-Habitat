# Observatoire Habitat — Phase‑12  
Analyse territoriale & indicateurs population  
Développé par **Nawal EL HAMDAOUI**, élève‑ingénieure à l’ENSAR (Science de la donnée)

---

## 📌 1. Présentation du projet

Ce dépôt contient l’ensemble des scripts, indicateurs, graphiques et rapports produits dans le cadre du projet **Observatoire Habitat**, visant à analyser les dynamiques démographiques des communes françaises.  
Le projet fournit un socle analytique robuste, reproductible et exploitable pour les besoins de la **DDT79**.

---

## 🎯 2. Objectifs du projet

- Construire un observatoire départemental des dynamiques habitat/population.  
- Produire des indicateurs robustes et reproductibles.  
- Générer des rapports automatisés pour diffusion interne/externe.  

---

## 🛠️ 3. Méthodologie

- Import et nettoyage des données INSEE/IGN.  
- Jointures territoriales (communes, EPCI, IRIS).  
- Calcul d’indicateurs population/logements.  
- Génération de graphiques (ggplot2).  
- Production de rapports RMarkdown (Phase‑11 & Phase‑12).  

---

## 📊 4. Indicateurs livrés

- Population municipale et totale.  
- Top/bottom 10 communes.  
- Classes de population.  
- Densité.  
- Évolution temporelle (si disponible).  
- Répartition des logements (si phase logements activée).  

---

## 📈 5. Graphiques livrés

- Histogrammes population.  
- Top 10 population.  
- Scatter population.  
- Courbes d’évolution (si phase logements activée).  

---

## 📄 6. Rapports livrés

- **Rapport population (Phase‑11)**  
- **Synthèse finale (Phase‑12)**  
- Rapport RMarkdown complet incluant :  
  - interprétation des indicateurs,  
  - analyse des graphiques,  
  - segmentation par classes de population,  
  - conclusions opérationnelles pour la DDT79,  
  - reproductibilité des scripts (R + SQL),  
  - documentation technique du pipeline.  

---

## 🧠 7. Interprétation des résultats (Phase‑12)

### ➤ Structure démographique
- Population municipale moyenne : **852 habitants**  
- Médiane : **336 habitants**  
- Distribution très asymétrique → majorité de petites communes rurales.  
- Ratio mun/tot ≈ **0,98** → indicateurs municipaux suffisants pour l’analyse.

### ➤ Histogrammes
- Pic massif dans la classe **0–500 habitants**.  
- Très faible nombre de communes > 5 000 habitants.  
→ Territoire fortement rural, fragmentation communale importante.

### ➤ Top 10 communes
- Annecy, Cherbourg-Octeville, Lomme, Le Chesnay, Seynod…  
→ Pôles urbains structurants : densification, mobilité, logement.

### ➤ Bottom 10 communes
- Communes entre **3 et 13 habitants**.  
→ Dépeuplement, fragilité démographique, enjeux de maintien des services.

### ➤ Scatter population municipale vs totale
- Corrélation quasi parfaite.  
→ Population municipale suffisante pour les analyses territoriales.

### ➤ Classes de population
- Majorité dans **0–500** et **500–1000 habitants**.  
→ Nécessité d’adapter les politiques habitat à la taille des communes.

---

## 📂 8. Arborescence du dépôt
data/        → données INSEE
R/           → scripts d’analyse
sql/         → requêtes SQL
outputs/     → graphiques, indicateurs
docs/        → rapports RMarkdown (Phase‑11 & Phase‑12)


---

## 🔁 9. Reproductibilité

Le projet est entièrement reproductible :  
- scripts R + SQL documentés,  
- pipeline structuré,  
- rapports générés automatiquement via RMarkdown.

---

## 🏁 10. Conclusion

Le projet **Observatoire Habitat** fournit :  
- un socle analytique solide,  
- des indicateurs fiables,  
- des graphiques interprétables,  
- une documentation complète,  
- une reproductibilité totale.

Il constitue une base idéale pour :  
- l’analyse habitat,  
- les diagnostics territoriaux,  
- la préparation des politiques publiques de la DDT79.

---

## 📬 Contact

**Nawal EL HAMDAOUI**  
Élève‑ingénieure ENSAR — Science de la donnée  
nawal.el.hamdaoui@etu.univ-poitiers.fr  

