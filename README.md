# Trading Tools – Python Launcher
**Made for speed, clarity and zero‑friction setup.**

Launcher **Windows (.bat)** per progetti Python orientati ad ogni uso ..dal trading, all’analisi dati e all’automazione.
Pensato per essere **robusto, semplice da usare e adatto anche a chi non ha dimestichezza con Python**.

---

## ✨ Funzionalità principali

### ▶️ Avvio script Python
- Rileva automaticamente tutti i file `.py` nella cartella
- Permette di selezionare quale script avviare
- Usa la versione di Python configurata come default

---

### ⚙️ Menu Impostazioni
Tutte le operazioni di gestione sono raccolte in un menu dedicato:

- **B** – Installa librerie BASE  
- **O** – Installa librerie OPZIONALI  
- **A** – Installa BASE + OPZIONALI  
- **R** – Installazione manuale da `requirements.txt`  
- **D** – Installazione dipendenze con *Auto‑Detect*  
- **I** – Installa Python 3.11 (via `winget`)  
- **P** – Seleziona versione di Python  
- **M** – Torna al menu principale  

---

## 🚀 Punto di forza: Auto‑Detect Dipendenze

La funzionalità **Auto‑Detect** è il vero cuore del launcher e lo rende PRO.

### Cosa fa
- Analizza **tutti i file `.py`** presenti dentro la cartella del laucher
- Usa il **parser AST ufficiale di Python** (non regex fragili)
- Individua automaticamente:
  - `import x`
  - `from x import y`
- Esclude in modo intelligente:
  - Standard Library (`os`, `sys`, `pathlib`, `ast`, ecc.)
  - Moduli built‑in
  - `__future__`
- Genera da solo un file `requirements_auto.txt`
- Installa dunque subito tutte le dipendenze con un solo comando `pip`

### Perché è superiore ai metodi classici
- ❌ Nessun errore da import multilinea
- ❌ Nessun falso positivo da commenti o stringhe
- ❌ Nessun crash su codice incompleto
- ✅ Funziona anche con progetti sporchi o legacy
- ✅ Ideale quando cloni repository senza requirements

In pratica:  
> **metti gli script → premi D → ambiente pronto**

---

## 🐍 Gestione Python
- Supporta più versioni installate
- Salva la versione predefinita in `python_default.cmd`
- Installa automaticamente **Python 3.11** su Windows con il comandi I dalle impostazioni :
  ```
  winget install --id Python.Python.3.11 -e
  ```

---


---

## 🎯 Ideale per
- Trading tools e bot
- Script di analisi tecnica
- Progetti Python modulari
- Ambienti Windows senza setup complessi
- Team non tecnici o utenti finali

---

## 🔒 Affidabilità
Il launcher è progettato per:
- non rompersi su errori Python
- non richiedere privilegi elevati
- non dipendere da software esterno (oltre a Python / winget)

---

## 📄 Licenza
Uso libero.  
Modificabile, estendibile, adattabile a qualsiasi progetto Python.

---


