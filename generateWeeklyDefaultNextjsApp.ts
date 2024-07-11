import * as fs from 'fs';
import * as path from 'path';
import { exec } from 'child_process';
import { promisify } from 'util';

const execAsync = promisify(exec);

async function getLastMonday(): Promise<string> {
    const today = new Date();
    const daysSinceMonday = today.getDay() === 0 ? 6 : today.getDay() - 1;
    const lastMonday = new Date(today);
    lastMonday.setDate(today.getDate() - daysSinceMonday);
    return lastMonday.toISOString().split('T')[0];
}

async function runCommand(command: string): Promise<void> {
    const { stdout, stderr } = await execAsync(command);
    if (stderr) console.error(stderr);
    console.log(stdout);
}

async function main(): Promise<void> {
    // Assuming we're already in the correct repository directory
    await runCommand('git pull');

    const lastMonday = await getLastMonday();
    if (!fs.existsSync(lastMonday)) {
        fs.mkdirSync(lastMonday);
        process.chdir(lastMonday);
        
        await runCommand('npx create-next-app@latest base-nextjs-app -y --ts --no-tailwind --src-dir --app --import-alias "@/*"');
        
        process.chdir('..');
        await runCommand('git add .');
        await runCommand(`git commit -m "Add Next.js base app for ${lastMonday}"`);
        await runCommand('git push');
    }
}

main().catch(console.error);
