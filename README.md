

# Python Launcher PRO

**Made for speed, clarity and zero-friction setup.**

**Python Launcher PRO** è un launcher **Windows (.bat)** pensato per rendere l’utilizzo di applicazioni e strumenti scritti in **Python** semplice, affidabile e immediato, **indipendentemente dal livello tecnico dell’utente**.

Nasce per supportare progetti di **trading**, **analisi dati** e **automazione**, ma è progettato in modo **universale**, così da poter diventare la base operativa per qualsiasi software gestionale o strumento interno sviluppato in Python.

---

## ✨ Funzionalità principali

### ▶️ Avvio script Python

* Rileva automaticamente tutti i file `.py` presenti nella cartella
* Permette di selezionare in modo guidato quale script avviare
* Utilizza la versione di Python configurata come predefinita, senza richiedere interventi manuali

---

### ⚙️ Menu Impostazioni

Tutte le operazioni di gestione sono centralizzate in un menu dedicato, pensato anche per utenti non tecnici:

* **B** – Installa librerie BASE
* **O** – Installa librerie OPZIONALI
* **A** – Installa librerie BASE + OPZIONALI
* **R** – Installazione manuale dipendenze da `requirements.txt`
* **D** – Installazione automatica dipendenze con *Auto-Detect*
* **I** – Installazione di **Python 3.11** tramite `winget`
* **P** – Selezione della versione di Python da utilizzare
* **M** – Ritorno al menu principale

---

## 🚀 Punto di forza: Auto-Detect delle dipendenze

La funzionalità **Auto-Detect** rappresenta il vero elemento distintivo di **Python Launcher PRO**.

### Cosa fa

* Analizza automaticamente **tutti i file `.py`** presenti nella cartella del launcher
* Utilizza il **parser AST ufficiale di Python** (approccio strutturale, non basato su regex fragili)
* Individua in modo affidabile:

  * `import x`
  * `from x import y`
* Esclude in maniera intelligente:

  * Standard Library (`os`, `sys`, `pathlib`, `ast`, ecc.)
  * Moduli built-in
  * `__future__`
* Genera automaticamente il file `requirements_auto.txt`
* Installa tutte le dipendenze necessarie con un unico comando `pip`

### Perché è superiore ai metodi tradizionali

* ❌ Nessun errore causato da import multilinea
* ❌ Nessun falso positivo da commenti o stringhe
* ❌ Nessun crash in presenza di codice incompleto
* ✅ Funziona anche su progetti legacy o non strutturati
* ✅ Ideale quando si clona un repository privo di `requirements.txt`

In pratica:

> **aggiungi gli script → premi D → l’ambiente è pronto**

---

## 🐍 Gestione di Python

* Supporta più versioni di Python installate sul sistema
* Salva la versione predefinita in `python_default.cmd`
* Consente l’installazione automatica di **Python 3.11** su Windows direttamente dal menu Impostazioni tramite:

  ```
  winget install --id Python.Python.3.11 -e
  ```

Questo rende il launcher utilizzabile anche su macchine appena configurate o ambienti aziendali standard.

---

## 🎯 Ideale per

* Tool e bot di trading
* Script di analisi tecnica e reporting
* Progetti Python modulari
* Ambienti Windows dove è richiesto **zero setup manuale**
* Team operativi e utenti finali non tecnici
* Contesti aziendali e gestionali (hotel, uffici, operations)

---

## 🔒 Affidabilità

Il launcher è progettato per:

* non interrompersi in caso di errori Python
* non richiedere privilegi amministrativi
* ridurre al minimo la dipendenza da software esterno (solo Python e `winget`)

---

## 📄 Licenza

Uso libero.
Il progetto è **modificabile, estendibile e adattabile** a qualsiasi contesto operativo o aziendale.
