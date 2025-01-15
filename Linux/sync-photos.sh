#!/bin/bash

# /data/Photos/ --> /run/user/1000/gvfs/smb-share
# DRY RUN
rsync --ignore-existing -rnv /data/Photos/Toutes/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes > report-to-nas.txt
#rsync --ignore-existing -rnv /data/Photos/Toutes/Classées/2022/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2022 > report-2022.txt
#rsync --ignore-existing -rnv /data/Photos/Toutes/Classées/2023/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2023 > report-2023.txt
#rsync --ignore-existing -rnv /data/Photos/Toutes/Classées/2024/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2024 > report-2024.txt

# /data/Photos/ --> /run/user/1000/gvfs/smb-share
# RUN
#rsync --ignore-existing -rvP /data/Photos/Toutes/Classées/2022/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2022
#rsync --ignore-existing -rvP /data/Photos/Toutes/Classées/2023/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2023
#rsync --ignore-existing -rvP /data/Photos/Toutes/Classées/2024/ /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/Classées/2024

# /run/user/1000/gvfs/smb-share --> /data/Photos/
# DRY RUN
rsync --ignore-existing -rnv /run/user/1000/gvfs/smb-share:server=iliocelia.local,share=photos/Toutes/ /data/Photos/Toutes/ > report-from-nas.txt
