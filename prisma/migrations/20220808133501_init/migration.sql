-- CreateTable
CREATE TABLE "Individu" (
    "code" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "dateNaissance" TIMESTAMP(3) NOT NULL,
    "adresse" TEXT NOT NULL,

    CONSTRAINT "Individu_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "Formateur" (
    "codeFormateur" SERIAL NOT NULL,
    "codeIndividu" TEXT NOT NULL,

    CONSTRAINT "Formateur_pkey" PRIMARY KEY ("codeFormateur")
);

-- CreateTable
CREATE TABLE "Apprenant" (
    "codeApprenant" SERIAL NOT NULL,
    "codeIndividu" TEXT NOT NULL,

    CONSTRAINT "Apprenant_pkey" PRIMARY KEY ("codeApprenant")
);

-- CreateTable
CREATE TABLE "Formation" (
    "codeFormation" TEXT NOT NULL,
    "codeFormateur" INTEGER NOT NULL,

    CONSTRAINT "Formation_pkey" PRIMARY KEY ("codeFormation")
);

-- CreateTable
CREATE TABLE "Module" (
    "codeModule" TEXT NOT NULL,
    "intitule" TEXT NOT NULL,
    "objectif" TEXT NOT NULL,
    "contenu" TEXT NOT NULL,
    "duree" TEXT NOT NULL,
    "codeFormateur" INTEGER NOT NULL,

    CONSTRAINT "Module_pkey" PRIMARY KEY ("codeModule")
);

-- CreateTable
CREATE TABLE "FormationModule" (
    "chapitre" TEXT NOT NULL,
    "codeFormation" TEXT NOT NULL,
    "codeModule" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ModuleTag" (
    "codeModule" TEXT NOT NULL,
    "codeTag" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Tag" (
    "codeTag" TEXT NOT NULL,
    "valeur" TEXT NOT NULL,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("codeTag")
);

-- CreateIndex
CREATE UNIQUE INDEX "FormationModule_codeModule_codeFormation_key" ON "FormationModule"("codeModule", "codeFormation");

-- CreateIndex
CREATE UNIQUE INDEX "ModuleTag_codeModule_codeTag_key" ON "ModuleTag"("codeModule", "codeTag");

-- AddForeignKey
ALTER TABLE "Formateur" ADD CONSTRAINT "Formateur_codeIndividu_fkey" FOREIGN KEY ("codeIndividu") REFERENCES "Individu"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apprenant" ADD CONSTRAINT "Apprenant_codeIndividu_fkey" FOREIGN KEY ("codeIndividu") REFERENCES "Individu"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Formation" ADD CONSTRAINT "Formation_codeFormateur_fkey" FOREIGN KEY ("codeFormateur") REFERENCES "Formateur"("codeFormateur") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Module" ADD CONSTRAINT "Module_codeFormateur_fkey" FOREIGN KEY ("codeFormateur") REFERENCES "Formateur"("codeFormateur") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormationModule" ADD CONSTRAINT "FormationModule_codeFormation_fkey" FOREIGN KEY ("codeFormation") REFERENCES "Formation"("codeFormation") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormationModule" ADD CONSTRAINT "FormationModule_codeModule_fkey" FOREIGN KEY ("codeModule") REFERENCES "Module"("codeModule") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModuleTag" ADD CONSTRAINT "ModuleTag_codeModule_fkey" FOREIGN KEY ("codeModule") REFERENCES "Module"("codeModule") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModuleTag" ADD CONSTRAINT "ModuleTag_codeTag_fkey" FOREIGN KEY ("codeTag") REFERENCES "Tag"("codeTag") ON DELETE CASCADE ON UPDATE CASCADE;
