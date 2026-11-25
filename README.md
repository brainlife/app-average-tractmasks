<h1 align="center">Average tract density masks</h1>

<p align="center">
  One group-average mask per tract from tract density masks of several subjects in a common space.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.811"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.811-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> 📍 **This branch, `fsl-6.0.4-patched2-app-v1.0`, is the brainlife.io App Average tract density masks** ([doi:10.25663/brainlife.app.811](https://doi.org/10.25663/brainlife.app.811)).

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Averages tract density masks with the same file name across several tractmasks inputs using FSL fslmerge and fslmaths -Tmean.**

For each mask file name found in the inputs, concatenates the matching files and takes their mean to give one average mask per tract. Use it to build group-average tract maps from subjects already in a common space. As written, main calls ./average/sh instead of ./average.sh and the loop always looks up the first file name, so the App is likely broken.

| | |
|---|---|
| 📥 **Inputs** | `neuro/tractmasks` |
| 📤 **Outputs** | `neuro/tractmasks` |
| 🐳 **Container** | `brainlife/fsl:6.0.4-patched2` |
| ⚙️ **Resources** | 8 CPUs · 1.5 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.811](https://doi.org/10.25663/brainlife.app.811) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `inputs` | `neuro/tractmasks` | yes | Tract masks from several subjects or runs, with matching file names. All masks must be in the same space and voxel grid. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | Average tract masks, one per file name. |

<!-- brainlife-app:end -->

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.811](https://doi.org/10.25663/brainlife.app.811), select several `neuro/tractmasks` datasets from your project and press **Execute**. All masks must already be in the same space and on the same voxel grid, and masks of the same tract must share a file name across inputs. The result is a new `neuro/tractmasks` dataset tagged `average`.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). The App runs FSL from the `brainlife/fsl:6.0.4-patched2` container.

1. Clone this repository and check out the App branch: `git checkout fsl-6.0.4-patched2-app-v1.0`.
2. Create `config.json` listing the tract-mask directories to average (see `config.json.sample`):

   ```json
   {
       "inputs": [
           "testdata/2001/masks",
           "testdata/2009/masks",
           "testdata/2012/masks"
       ]
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

For every mask file name found in the inputs, `average.sh` concatenates the matching files with `fslmerge -t` and takes their mean over the fourth dimension with `fslmaths -Tmean`.

## 📦 Outputs

```text
masks/
└── masks/   one averaged NIfTI mask per tract file name found in the inputs
```

## 🩺 Troubleshooting

- **`something went wrong. check files and logs`**: `masks/masks` is empty. Check that every input directory contains mask files.
- **Known issues in the current code**: `main` calls `./average/sh` instead of `./average.sh`, and the loop in `average.sh` looks up the first file name (`mask_files[0]`) for every tract. Until these are fixed, the App is likely to fail or to average the wrong files; check the outputs before using them.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Average tract density masks. brainlife.io App. [doi:10.25663/brainlife.app.811](https://doi.org/10.25663/brainlife.app.811)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Brad Caron
- Franco Pestilli (project director)

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

[MIT](LICENSE). FSL itself is distributed under its own [license](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Licence).
