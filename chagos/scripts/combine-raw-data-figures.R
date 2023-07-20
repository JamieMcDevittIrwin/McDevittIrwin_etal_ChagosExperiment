# Combine all figures

library(ggpubr)

load("../bruvs/data/sharkabundance-region-tiles.RData") #p_sharksXregion_tiles
load("../dovs/data/tiles-chaetodontidae.RData") #p_tiles.chaet
load("../dovs/data/tiles-herbivores.RData") #p_tiles.herbivores
load("../dovs/data/tiles-mesopredators.RData") #p_tiles.mesopredators
load("../tiles/data/coral-effect-size.RData") # # p_tiles.effectsize
load("../tiles/data/cca-effect-size.RData") # # p_tiles.cca.effectsize
load("../tiles/data/algae-effect-size.RData") # # p_tiles.algae.effectsize
load("../tiles/data/turf-effect-size.RData") # # p_tiles.turf.effectsize
load("../grazing/data/grazing-rates-site.RData") # p_grazing
load("data/coral.by.site.RData") #p_benthic.coral


p_sharks <- p_sharksXregion_tiles + ggtitle("a)")
p_meso <- p_tiles.mesopredators + ggtitle("b)")
p_herbs <- p_tiles.herbivores + ggtitle("c)")
p_chaet <- p_tiles.chaet + ggtitle("d)")
p_graze <- p_grazing + ggtitle("e)")
p_coral <- p_tiles.effectsize + ggtitle("g)")
p_cca <- p_tiles.cca.effectsize + ggtitle("h)")
p_algae <- p_tiles.algae.effectsize + ggtitle("i)")
p_turf <- p_tiles.turf.effectsize + ggtitle("j)")
p_coral_cover <- p_benthic.coral +ggtitle("f)")



p_all <- ggarrange(p_sharks,
                         p_coral_cover,
                         p_meso,
                         p_coral,
                         p_herbs,
                         p_cca,
                         p_chaet,
                         p_algae,
                         p_graze,
                         p_turf,
                         common.legend = TRUE,
                         ncol=2,nrow=5)

p_all



ggsave(p_all, file="figures/sharks-fish-tiles-raw.png",
       height=15,
       width=10)
