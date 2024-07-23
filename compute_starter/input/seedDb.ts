import { FileMetaService } from './DbClientFactory';
import { PrismaClient } from '@prisma/client'

export async function seedDb() {
    const prisma = new PrismaClient();
    const mapboxPublicConfigService = new FileMetaService(prisma);
    await FileMetaService.create({
        // todo with fakerjs
    });
    const loadedFileMeta = await mapboxPublicConfigService.findAll();
    console.log(JSON.stringify(loadedFileMeta, null, 4));
    await prisma.$disconnect();
}

console.log('Seeding database...');
seedDb().then(() => console.log("Database seeded!")).catch(err => console.log(err));
