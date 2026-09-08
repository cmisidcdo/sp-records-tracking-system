<?php
$cityCouncilProposalChecked = !empty($record['proposed_by_city_council_member'])
    || trim((string) ($record['proposed_ordinance_number'] ?? '')) !== ''
    || trim((string) ($record['proposed_resolution_number'] ?? '')) !== '';
$cityCouncilProposedType = trim((string) ($record['proposed_resolution_number'] ?? '')) !== ''
    ? 'resolution'
    : 'ordinance';
$cityCouncilProposedNumber = $cityCouncilProposedType === 'resolution'
    ? (string) ($record['proposed_resolution_number'] ?? '')
    : (string) ($record['proposed_ordinance_number'] ?? '');
$cityCouncilProposedNumber = preg_replace('/^\d{4}\s*-\s*/', '', $cityCouncilProposedNumber) ?: $cityCouncilProposedNumber;
$cityCouncilProposalFieldSuffix = (int) ($record['id'] ?? 0);
?>
<section class="full legislative-field city-council-proposal-panel" data-city-council-proposal-panel>
    <label class="city-council-proposal-toggle" for="city_council_proposal_<?= $cityCouncilProposalFieldSuffix ?>">
        <input id="city_council_proposal_<?= $cityCouncilProposalFieldSuffix ?>" type="checkbox"
            name="proposed_by_city_council_member" value="1" data-city-council-proposal-toggle
            <?= $cityCouncilProposalChecked ? 'checked' : '' ?>>
        <span>
            <strong>Proposed by a City Council Member</strong>
            <small>Check this when the record is a proposed ordinance or resolution from a Council Member.</small>
        </span>
    </label>
    <div class="city-council-proposal-fields" data-city-council-proposal-fields <?= $cityCouncilProposalChecked ? '' : 'hidden' ?>>
        <label>Proposed Type
            <select name="city_council_proposed_type" data-city-council-proposed-control <?= $cityCouncilProposalChecked ? '' : 'disabled' ?>>
                <option value="ordinance" <?= $cityCouncilProposedType === 'ordinance' ? 'selected' : '' ?>>Proposed Ordinance</option>
                <option value="resolution" <?= $cityCouncilProposedType === 'resolution' ? 'selected' : '' ?>>Proposed Resolution</option>
            </select>
        </label>
        <label>Proposed Number <span class="muted">(Optional)</span>
            <div class="city-council-proposal-number">
                <span><?= e(date('Y')) ?>-</span>
                <input name="city_council_proposed_number" value="<?= e($cityCouncilProposedNumber) ?>"
                    maxlength="75" inputmode="numeric" placeholder="Example: 001"
                    data-city-council-proposed-control <?= $cityCouncilProposalChecked ? '' : 'disabled' ?>>
            </div>
        </label>
        <p>The proposed number will stay connected to this record and appear in <strong>For Plenary</strong>. It may also be assigned or edited later.</p>
    </div>
</section>
<script>
document.querySelectorAll('[data-city-council-proposal-panel]').forEach((panel) => {
    const toggle = panel.querySelector('[data-city-council-proposal-toggle]');
    const fields = panel.querySelector('[data-city-council-proposal-fields]');
    const controls = Array.from(panel.querySelectorAll('[data-city-council-proposed-control]'));
    const syncCouncilProposalFields = () => {
        const isChecked = Boolean(toggle?.checked);
        fields.hidden = !isChecked;
        controls.forEach((control) => {
            control.disabled = !isChecked;
        });
    };
    toggle?.addEventListener('change', syncCouncilProposalFields);
    syncCouncilProposalFields();
});
</script>
