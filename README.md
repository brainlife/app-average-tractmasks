<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Averages tract density masks with the same file name across several tractmasks inputs using FSL fslmerge and fslmaths -Tmean.**

For each mask file name found in the inputs, concatenates the matching files and takes their mean to give one average mask per tract. Use it to build group-average tract maps from subjects already in a common space. As written, main calls ./average/sh instead of ./average.sh and the loop always looks up the first file name, so the App is likely broken.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.811](https://doi.org/10.25663/brainlife.app.811)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `inputs` | `neuro/tractmasks` | yes | Tract masks from several subjects or runs, with matching file names. All masks must be in the same space and voxel grid. |

| Output | Datatype | Description |
|---|---|---|
| `masks` | `neuro/tractmasks` | Average tract masks, one per file name. |

Runtime: container `brainlife/fsl:6.0.4-patched2`; 8 CPUs; 1.5 h walltime.

<!-- brainlife-app:end -->

# app-average-tractmasks