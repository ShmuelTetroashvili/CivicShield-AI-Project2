# לוח משימות ומעקב ביצוע (TODO) – CivicShield AI

## שלב 1: מבנה פרויקט ומסמכי תכנון
- [x] הקמת עץ התיקיות (`chapters/`, `figures/`, `scripts/`, `agents/`)
- [x] כתיבת מסמך דרישות המוצר (`PRD.md`)
- [x] כתיבת תוכנית האדריכלות (`PLAN.md`)
- [x] יצירת לוח משימות ראשוני (`TODO.md`)

## שלב 2: מנוע הסימולציות והגרפים ב-Python
- [x] פיתוח סקריפט `scripts/generate_figures.py` (מודלים SIRI, Hegselmann-Krause, ROC, Framing, M/M/c, ROI)
- [x] הרצת הסקריפט באמצעות `uv` ויצירת 6 גרפי PDF ו-6 גרפי PNG בתיקיית `figures/`

## שלב 3: עיצוב תבנית ה-LaTeX המקורית (`civicshield.cls`)
- [x] הגדרת `babel` (עברית RTL + אנגלית BiDi) ו-`fontspec` מותאם MiKTeX LuaLaTeX (`layout=lists.tabular` + `\babelsublr`)
- [x] עיצוב פלטת צבעים, שוליים, כותרות עמוד ותיבות `tcolorbox` (`rfpbox`, `theorybox`, `archbox`, `mathbox`, `riskbox`)
- [x] אימות קומפילציה נקייה ב-`lualatex --disable-installer`

## שלב 4: כתיבת הדוח המכין (8 פרקים + קובץ ראשי, יעד 37–45 עמודים)
- [x] כתיבת `main.tex` (שער ב-TikZ, תעודת זהות חוזה, תוכן עניינים, הכללת פרקים וביבליוגרפיה)
- [x] פרק 1 (`chapters/ch01_executive_rfp.tex`): תקציר מנהלים, רקע המכרז ואיור CONOPS ב-TikZ
- [x] פרק 2 (`chapters/ch02_theory_comm_poli.tex`): תשתית תיאורטית (תקשורת ומדעי המדינה) + איור TikZ
- [x] פרק 3 (`chapters/ch03_requirements_usecases.tex`): דרישות פונקציונליות, תרחישי ייחוס וגרף מסגור (`fig4`)
- [x] פרק 4 (`chapters/ch04_architecture_agents.tex`): ארכיטקטורה 5-שכבתית, ReAct ו-2 איורי TikZ גדולים
- [x] פרק 5 (`chapters/ch05_math_models_simulations.tex`): פיתוח מתמטי מלא + 4 גרפי Python (`fig1`, `fig2`, `fig3`, `fig5`)
- [x] פרק 6 (`chapters/ch06_ethics_law_regulation.tex`): משפט חוקתי, דמוקרטיה מתגוננת ועץ החלטות ב-TikZ
- [x] פרק 7 (`chapters/ch07_risks_roadmap_budget.tex`): ניהול סיכונים, גאנט ב-TikZ, תקציב וגרף ROI (`fig6`)
- [x] פרק 8 (`chapters/ch08_multiagent_methodology.tex`): מתודולוגיית ועדת הסוכנים, תרשים TikZ ולקחי צוות אדום

## שלב 5: קימפול ואימות דטרמיניסטי
- [x] הרצת `lualatex` (שני מעברים) ליצירת `CivicShield_AI_Preliminary_Report.pdf` (**44 עמודים**, `0` שגיאות LaTeX/BiDi)
- [x] כתיבת והרצת `scripts/verify_report.py` לבדיקת היקף (37–45 עמודים), תקינות קבצים ואפס שגיאות

## שלב 6: קובצי ועדת הסוכנים ו-GitHub
- [x] יצירת `team.json`, `AGY.md`, ותיקיות `agents/*`
- [x] כתיבת `README.md` דו-לשוני מלא ועשיר + `.gitignore`
- [x] פתיחת רפוזיטורי ציבורי `CivicShield-AI-Project2` ב-GitHub והעלאה מלאה (`git push`)
