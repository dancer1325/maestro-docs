import { LaunchArguments } from 'react-native-launch-arguments'

export const isFooEnabled = () => {
    try {
        const foo = LaunchArguments.value().isFooEnabled
        return !!foo
    } catch (e) {
        return false
    }
}