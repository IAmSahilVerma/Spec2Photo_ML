SELECT
    
    s.specObjID, s.bestObjID, s.z, s.zErr, s.zWarning,
    s.class, s.subClass, s.ra, s.dec,
    s.plate, s.mjd, s.fiberID,
    s.velDisp AS velocityDisp, s.snMedian,
    
    p.modelMag_u, p.modelMag_g, p.modelMag_r, p.modelMag_i, p.modelMag_z,
    p.petroMag_u, p.petroMag_g, p.petroMag_r, p.petroMag_i, p.petroMag_z,
    p.psfMag_u, p.psfMag_g, p.psfMag_r, p.psfMag_i, p.psfMag_z,
    p.fiberMag_u, p.fiberMag_g, p.fiberMag_r, p.fiberMag_i, p.fiberMag_z,
    p.expMag_r, p.deVMag_r, p.cModelMag_r,
    p.extinction_u, p.extinction_g, p.extinction_r, p.extinction_i, p.extinction_z,
    p.petroRad_r, p.expRad_r, p.deVRad_r, p.fracDev_r,
    p.type, p.clean,
    
    l.oii_3726_flux, l.oii_3726_eqw,
    l.oii_3729_flux, l.oii_3729_eqw,
    l.neiii_3869_flux, l.neiii_3869_eqw,
    l.h_delta_flux, l.h_delta_eqw,
    l.h_gamma_flux, l.h_gamma_eqw,
    l.oiii_4363_flux, l.oiii_4363_eqw,
    l.h_beta_flux, l.h_beta_eqw,
    l.oiii_4959_flux, l.oiii_4959_eqw,
    l.oiii_5007_flux, l.oiii_5007_eqw,
    l.hei_5876_flux, l.hei_5876_eqw,
    l.oi_6300_flux, l.oi_6300_eqw,
    l.nii_6548_flux, l.nii_6548_eqw,
    l.h_alpha_flux, l.h_alpha_eqw,
    l.nii_6584_flux, l.nii_6584_eqw,
    l.sii_6717_flux, l.sii_6717_eqw,
    l.sii_6731_flux, l.sii_6731_eqw,
    l.ariii7135_flux, l.ariii7135_eqw,

    
    i.lick_cn1, i.lick_cn2,
    i.lick_ca4227,
    i.lick_fe4383,
    i.lick_fe4531,
    i.lick_c4668,
    i.lick_hb,
    i.lick_fe5015,
    i.lick_mg1, i.lick_mg2, i.lick_mgb,
    i.lick_fe5270,
    i.lick_fe5335,
    i.lick_fe5406,
    i.lick_fe5709,
    i.lick_fe5782,
    i.lick_nad,
    i.lick_tio1,
    i.lick_tio2,
    i.lick_hd_a,
    i.lick_hg_a,
    i.d4000,

    i.d4000_n,
    i.d4000_red,
    i.d4000_n_red,
    i.d4000_n_blue,
  
    m.lgm_tot_p50 AS logM_star

INTO mydb.Galaxies_0t36
  
FROM SpecObjAll s

JOIN PhotoObjAll p ON s.bestObjID = p.objID
JOIN galSpecExtra m ON s.specObjID = m.specObjID
LEFT JOIN galSpecLine l ON s.specObjID = l.specObjID
LEFT JOIN galSpecIndx i ON s.specObjID = i.specObjID

WHERE s.class = 'GALAXY'
  AND s.zWarning = 0
  AND s.ra >= 0 AND s.ra < 36